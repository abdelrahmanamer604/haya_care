import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/core/utils/responsive.dart';
import 'package:haya_care/core/widgets/app_segmented_toggle.dart';
import 'package:haya_care/core/widgets/empty_state_widget.dart';
import 'package:haya_care/features/patient/profile/data/profile_demo_data.dart';
import 'package:haya_care/features/patient/profile/presentation/controllers/profile_sub_controllers.dart';
import 'package:haya_care/features/patient/profile/presentation/widgets/health_tips/health_tip_card.dart';
import 'package:haya_care/features/patient/profile/presentation/widgets/shared/profile_sub_header.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class PatientHealthTipsScreen extends StatefulWidget {
  const PatientHealthTipsScreen({super.key});

  @override
  State<PatientHealthTipsScreen> createState() =>
      _PatientHealthTipsScreenState();
}

class _PatientHealthTipsScreenState extends State<PatientHealthTipsScreen> {
  final PatientHealthTipsController _controller = PatientHealthTipsController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final colors = context.appColors;
    final textTheme = context.textTheme;
    final allTips = getDemoHealthTips(s);

    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: SafeArea(
        bottom: false,
        child: AdaptiveScaffoldWrapper(
          maxContentWidth: 440,
          child: ListenableBuilder(
            listenable: _controller,
            builder: (context, _) {
              final tips = _controller.filterTips(allTips);
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.fromLTRB(20.w, 14.h, 20.w, 28.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileSubHeader(title: s.healthTipsTitle, subtitle: s.healthTipsPageSubtitle),
                    SizedBox(height: 18.h),
                    AppSegmentedToggle<int>(
                      height: 42.h,
                      borderRadius: 14.0,
                      fontSize: 11.5,
                      selectedValue: _controller.selectedFilter,
                      onChanged: _controller.selectFilter,
                      options: [
                        AppToggleOption(value: 0, label: s.tipCategoryAll),
                        AppToggleOption(value: 1, label: s.tipCategoryHeart),
                        AppToggleOption(value: 2, label: s.tipCategoryNutrition),
                        AppToggleOption(value: 3, label: s.tipCategoryMedications),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    if (tips.isEmpty)
                      EmptyStateWidget(
                        icon: Icons.lightbulb_outline_rounded,
                        title: s.noTipsFound,
                        subtitle: s.noTipsFoundSub,
                        actionLabel: s.resetSearchAction,
                        onAction: () => _controller.selectFilter(0),
                      )
                    else
                      ...tips.map(
                        (tip) => Padding(
                          padding: EdgeInsets.only(bottom: 12.h),
                          child: HealthTipCard(
                            icon: tip.icon,
                            category: tip.category,
                            title: tip.title,
                            description: tip.description,
                          ),
                        ),
                      ),
                    SizedBox(height: 8.h),
                    Center(
                      child: Text(
                        s.healthTipsDisclaimer,
                        textAlign: TextAlign.center,
                        style: textTheme.labelSmall?.copyWith(fontSize: 11.sp, color: colors.secondaryText),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
