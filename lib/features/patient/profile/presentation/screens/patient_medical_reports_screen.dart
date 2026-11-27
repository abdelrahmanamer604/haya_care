import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/utils/app_feedback.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/core/utils/responsive.dart';
import 'package:haya_care/core/widgets/app_button.dart';
import 'package:haya_care/core/widgets/app_segmented_toggle.dart';
import 'package:haya_care/features/patient/profile/data/profile_demo_data.dart';
import 'package:haya_care/features/patient/profile/presentation/controllers/profile_sub_controllers.dart';
import 'package:haya_care/features/patient/profile/presentation/widgets/shared/profile_sub_header.dart';
import 'package:haya_care/features/patient/profile/presentation/widgets/reports/report_metric_cards.dart';
import 'package:haya_care/features/patient/profile/presentation/widgets/reports/report_summary_banner.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class PatientMedicalReportsScreen extends StatefulWidget {
  const PatientMedicalReportsScreen({super.key});

  @override
  State<PatientMedicalReportsScreen> createState() =>
      _PatientMedicalReportsScreenState();
}

class _PatientMedicalReportsScreenState
    extends State<PatientMedicalReportsScreen> {
  final PatientReportsController _controller = PatientReportsController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final summaries = getReportSummaries(s);

    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: SafeArea(
        bottom: false,
        child: AdaptiveScaffoldWrapper(
          maxContentWidth: 440,
          child: ListenableBuilder(
            listenable: _controller,
            builder: (context, _) {
              final current = summaries[_controller.selectedPeriod];
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.fromLTRB(20.w, 14.h, 20.w, 28.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileSubHeader(title: s.medicalReportsTitle, subtitle: s.reportsPageSubtitle),
                    SizedBox(height: 16.h),
                    AppSegmentedToggle<int>(
                      height: 42.h,
                      borderRadius: 14.0,
                      fontSize: 12.0,
                      selectedValue: _controller.selectedPeriod,
                      onChanged: _controller.selectPeriod,
                      options: [
                        AppToggleOption(value: 0, label: s.periodThisWeek),
                        AppToggleOption(value: 1, label: s.periodThisMonth),
                        AppToggleOption(value: 2, label: s.periodThreeMonths),
                      ],
                    ),
                    SizedBox(height: 14.h),
                    ReportSummaryBanner(title: current.title, dateRange: current.dateRange),
                    SizedBox(height: 14.h),
                    Row(children: [
                      Expanded(child: ReportMetricCard(label: s.avgBloodPressure, value: current.bp, unit: s.unitMmHg)),
                      SizedBox(width: 12.w),
                      Expanded(child: ReportMetricCard(label: s.avgBloodSugar, value: current.sugar, unit: s.unitMgDl)),
                    ]),
                    SizedBox(height: 12.h),
                    Row(children: [
                      Expanded(child: ReportMetricCard(label: s.avgWeight, value: current.weight, unit: s.unitKg)),
                      SizedBox(width: 12.w),
                      Expanded(child: ReportMetricCard(label: s.avgHeartRate, value: current.heartRate, unit: s.unitBpm)),
                    ]),
                    SizedBox(height: 12.h),
                    ReportMetricCard(label: s.medicationAdherence, value: current.adherence, unit: s.periodThisMonth),
                    SizedBox(height: 14.h),
                    ReportIncludesCard(
                      title: s.reportIncludesTitle,
                      items: [s.reportIncludeBp, s.reportIncludeSugar, s.reportIncludeWeightHr, s.reportIncludeLog],
                    ),
                    SizedBox(height: 18.h),
                    AppButton(
                      text: s.exportPdfButton,
                      leadingIcon: Icons.description_outlined,
                      isLoading: _controller.isExporting,
                      onPressed: () async {
                        final ok = await _controller.exportPdf(current, s);
                        if (!context.mounted) return;
                        if (ok) {
                          AppFeedback.showSuccess(context, s.exportPdfSuccess);
                        } else {
                          AppFeedback.showError(context, s.exportPdfError);
                        }
                      },
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
