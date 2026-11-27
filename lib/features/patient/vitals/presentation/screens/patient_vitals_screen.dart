import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/routing/routes.dart';
import 'package:haya_care/core/utils/app_feedback.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/core/utils/responsive.dart';
import 'package:haya_care/core/widgets/app_button.dart';
import 'package:haya_care/core/widgets/sticky_pull_header_scroll_view.dart';
import 'package:haya_care/features/patient/vitals/data/models/vital_reading_model.dart';
import 'package:haya_care/features/patient/vitals/presentation/controllers/patient_vitals_controller.dart';
import 'package:haya_care/features/patient/vitals/presentation/widgets/add_reading/add_vital_reading_sheet.dart';
import 'package:haya_care/features/patient/vitals/presentation/widgets/main/vitals_date_dropdown.dart';
import 'package:haya_care/features/patient/vitals/presentation/widgets/main/vitals_header.dart';
import 'package:haya_care/features/patient/vitals/presentation/widgets/main/vitals_readings_list.dart';
import 'package:haya_care/features/patient/vitals/presentation/widgets/main/vitals_tab_bar.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class PatientVitalsScreen extends StatefulWidget {
  final PatientVitalsController? controller;

  const PatientVitalsScreen({super.key, this.controller});

  @override
  State<PatientVitalsScreen> createState() => _PatientVitalsScreenState();
}

class _PatientVitalsScreenState extends State<PatientVitalsScreen> {
  late final PatientVitalsController _controller;
  late final bool _ownsController;

  @override
  void initState() {
    super.initState();
    _ownsController = widget.controller == null;
    _controller = widget.controller ?? PatientVitalsController();
  }

  @override
  void dispose() {
    if (_ownsController) _controller.dispose();
    super.dispose();
  }

  void _openAddReadingSheet(S s, {VitalReadingModel? initialReading}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: context.appColors.cardBackground,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24.r))),
      builder: (_) => AddVitalReadingSheet(
        category: _controller.selectedCategory,
        initialReading: initialReading,
        onSave: (value, note) {
          if (initialReading != null) {
            _controller.updateReading(original: initialReading, value: value, note: note);
          } else {
            _controller.addReading(s: s, value: value, note: note);
          }
        },
        onDelete: initialReading != null
            ? () {
                _controller.deleteReading(initialReading.id);
                Navigator.of(context).pop();
                AppFeedback.showSuccess(context, s.readingDeletedSuccess);
              }
            : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final textTheme = context.textTheme;
    final colors = context.appColors;

    return ListenableBuilder(
      listenable: _controller,
      builder: (context, _) {
        final readings = _controller.filteredReadings(s);
        return Scaffold(
          backgroundColor: context.theme.scaffoldBackgroundColor,
          body: SafeArea(
            bottom: false,
            child: AdaptiveScaffoldWrapper(
              maxContentWidth: 440,
              child: StickyPullHeaderScrollView(
                headerHeight: 56,
                header: VitalsHeader(
                  onAnalyticsTap: () => Navigator.of(context).pushNamed(Routes.patientAnalytics),
                ),
                children: [
                  SizedBox(height: 10.h),
                  Text(s.vitalsNav, style: textTheme.headlineMedium?.copyWith(fontSize: 26.sp, fontWeight: FontWeight.bold, color: colors.brandNavy)),
                  SizedBox(height: 2.h),
                  Text(s.readingsHistorySubtitle, style: textTheme.bodySmall?.copyWith(fontSize: 12.5.sp, color: colors.secondaryText)),
                  SizedBox(height: 16.h),
                  VitalsTabBar(selectedCategory: _controller.selectedCategory, onChanged: _controller.selectCategory),
                  SizedBox(height: 14.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(s.readingsCount(readings.length), style: textTheme.labelSmall?.copyWith(fontSize: 12.sp, color: colors.secondaryText)),
                      VitalsDateDropdown(selectedFilter: _controller.selectedFilter, onChanged: _controller.selectFilter),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  VitalsReadingsList(
                    readings: readings,
                    category: _controller.selectedCategory,
                    filter: _controller.selectedFilter,
                    onReadingTap: (r) => _openAddReadingSheet(s, initialReading: r),
                  ),
                  SizedBox(height: 18.h),
                  AppButton(
                    text: s.addReading,
                    variant: AppButtonVariant.orange,
                    leadingIcon: Icons.add_rounded,
                    width: double.infinity,
                    height: 50.h,
                    borderRadius: 16.r,
                    onPressed: () => _openAddReadingSheet(s),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
