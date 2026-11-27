import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/core/utils/responsive.dart';
import 'package:haya_care/core/widgets/tap_scale_widget.dart';
import 'package:haya_care/features/patient/vitals/presentation/controllers/patient_analytics_controller.dart';
import 'package:haya_care/features/patient/vitals/presentation/widgets/analytics/analytics_metric_cards_list.dart';
import 'package:haya_care/features/patient/vitals/presentation/widgets/analytics/analytics_period_tabs.dart';
import 'package:haya_care/features/patient/vitals/presentation/widgets/analytics/analytics_reading_log.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class PatientAnalyticsScreen extends StatefulWidget {
  const PatientAnalyticsScreen({super.key});

  @override
  State<PatientAnalyticsScreen> createState() => _PatientAnalyticsScreenState();
}

class _PatientAnalyticsScreenState extends State<PatientAnalyticsScreen> {
  final PatientAnalyticsController _controller = PatientAnalyticsController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final theme = context.theme;
    final textTheme = context.textTheme;
    final colors = context.appColors;
    final xLabels = [s.sat, s.mon, s.wed, s.fri];

    return ListenableBuilder(
      listenable: _controller,
      builder: (context, _) {
        final shift = switch (_controller.selectedPeriod) {
          AnalyticsPeriod.daily => -4.0,
          AnalyticsPeriod.weekly => 0.0,
          AnalyticsPeriod.monthly => 5.0,
        };

        return Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor,
          body: SafeArea(
            child: AdaptiveScaffoldWrapper(
              maxContentWidth: 440,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 28.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TapScaleWidget(
                      scale: 0.94,
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        width: 42.r,
                        height: 42.r,
                        decoration: BoxDecoration(
                          color: theme.cardTheme.color,
                          borderRadius: BorderRadius.circular(14.r),
                          boxShadow: const [
                            BoxShadow(
                              color: AppColors.shadowColor,
                              blurRadius: 10,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        alignment: Alignment.center,
                        child: Icon(
                          context.backChevron,
                          color: colors.primaryText,
                          size: 22.sp,
                        ),
                      ),
                    ),
                    SizedBox(height: 18.h),
                    Text(
                      s.healthAnalyticsTitle,
                      style: textTheme.headlineMedium?.copyWith(
                        fontSize: 26.sp,
                        fontWeight: FontWeight.bold,
                        color: colors.brandNavy,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      s.healthAnalyticsSubtitle,
                      style: textTheme.bodySmall?.copyWith(
                        fontSize: 12.5.sp,
                        color: colors.secondaryText,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    AnalyticsPeriodTabs(
                      selectedPeriod: _controller.selectedPeriod,
                      onSelected: _controller.selectPeriod,
                    ),
                    SizedBox(height: 18.h),
                    AnalyticsMetricCardsList(shift: shift, xLabels: xLabels),
                    SizedBox(height: 22.h),
                    AnalyticsReadingLog(
                      onViewAll: () => Navigator.of(context).pop(),
                    ),
                    SizedBox(height: 16.h),
                    Center(
                      child: Text(
                        s.analyticsDisclaimer,
                        textAlign: TextAlign.center,
                        style: textTheme.labelSmall?.copyWith(
                          fontSize: 10.5.sp,
                          color: colors.secondaryText,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
