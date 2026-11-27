import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/core/utils/responsive.dart';
import 'package:haya_care/core/widgets/empty_state_widget.dart';
import 'package:haya_care/core/widgets/sticky_pull_header_scroll_view.dart';
import 'package:haya_care/core/widgets/tap_scale_widget.dart';
import 'package:haya_care/features/patient/doctors/presentation/widgets/doctors_brand_header.dart';
import 'package:haya_care/features/patient/profile/presentation/controllers/profile_sub_controllers.dart';
import 'package:haya_care/features/patient/profile/presentation/widgets/medications/add_medication_bottom_sheet.dart';
import 'package:haya_care/features/patient/profile/presentation/widgets/medications/medication_dose_card.dart';
import 'package:haya_care/features/patient/profile/presentation/widgets/medications/medications_summary_banner.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class PatientMedicationsScreen extends StatefulWidget {
  const PatientMedicationsScreen({super.key});

  @override
  State<PatientMedicationsScreen> createState() =>
      _PatientMedicationsScreenState();
}

class _PatientMedicationsScreenState extends State<PatientMedicationsScreen> {
  final PatientMedicationsController _controller =
      PatientMedicationsController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller.initIfNeeded(S.of(context)!);
  }

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

    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: SafeArea(
        bottom: false,
        child: AdaptiveScaffoldWrapper(
          maxContentWidth: 440,
          child: ListenableBuilder(
            listenable: _controller,
            builder: (context, _) {
              final doses = _controller.doses;
              return StickyPullHeaderScrollView(
                headerHeight: 54,
                header: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const DoctorsBrandHeader(),
                    TapScaleWidget(
                      scale: 0.94,
                      onTap: () => showAddMedicationBottomSheet(context, _controller),
                      child: Container(
                        width: 40.r,
                        height: 40.r,
                        decoration: BoxDecoration(
                          color: colors.cardBackground,
                          borderRadius: BorderRadius.circular(14.r),
                          boxShadow: const [BoxShadow(color: AppColors.shadowColor, blurRadius: 10, offset: Offset(0, 2))],
                        ),
                        alignment: Alignment.center,
                        child: Icon(Icons.add_rounded, color: colors.brandNavy, size: 22.sp),
                      ),
                    ),
                  ],
                ),
                children: [
                  SizedBox(height: 10.h),
                  Text(s.medicationsNav, style: textTheme.headlineMedium?.copyWith(fontSize: 24.sp, fontWeight: FontWeight.bold, color: colors.brandNavy)),
                  SizedBox(height: 2.h),
                  Text(s.medicationsPageSubtitle, style: textTheme.bodySmall?.copyWith(fontSize: 12.sp, color: colors.secondaryText)),
                  SizedBox(height: 18.h),
                  MedicationsSummaryBanner(activeCount: doses.length, adherencePercent: '89%'),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(s.todaysDoses, style: textTheme.titleMedium?.copyWith(fontSize: 16.sp, fontWeight: FontWeight.bold, color: colors.brandNavy)),
                      Text(s.demoTodayDateLabel, style: textTheme.labelMedium?.copyWith(fontSize: 12.sp, fontWeight: FontWeight.bold, color: AppColors.orangeBadge)),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  if (doses.isEmpty)
                    EmptyStateWidget(
                      icon: Icons.medication_outlined,
                      title: s.noMedicationsTitle,
                      subtitle: s.noMedicationsSubtitle,
                    )
                  else
                    ...doses.map((dose) => Padding(
                      padding: EdgeInsets.only(bottom: 14.h),
                      child: MedicationDoseCard(
                        name: dose.name,
                        dosage: dose.dosage,
                        schedule: dose.schedule,
                        isTaken: _controller.isTaken(dose),
                        onToggleTaken: () => _controller.toggleDose(dose),
                        onEditTap: () => showAddMedicationBottomSheet(
                          context,
                          _controller,
                          existingDose: dose,
                        ),
                      ),
                    )),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
