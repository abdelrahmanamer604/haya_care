import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/core/widgets/app_segmented_toggle.dart';
import 'package:haya_care/features/patient/home/presentation/widgets/home_health_chart_data.dart';
import 'package:haya_care/features/patient/home/presentation/widgets/home_health_chart_legend.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class HomeHealthChartCard extends StatefulWidget {
  final VoidCallback? onDetailsTap;

  const HomeHealthChartCard({super.key, this.onDetailsTap});

  @override
  State<HomeHealthChartCard> createState() => _HomeHealthChartCardState();
}

class _HomeHealthChartCardState extends State<HomeHealthChartCard> {
  int _selectedPeriod = 0;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final theme = context.theme;
    final textTheme = context.textTheme;
    final colors = context.appColors;
    final isRtl = context.isRtl;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: theme.cardTheme.color,
        borderRadius: BorderRadius.circular(22.r),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: 14,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      s.healthIndicatorsTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.labelMedium?.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      s.trackReadingsOverTime,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.labelSmall?.copyWith(fontSize: 11.sp),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 8.w),
              GestureDetector(
                onTap: widget.onDetailsTap,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      s.details,
                      style: textTheme.titleSmall?.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.orangeBadge,
                      ),
                    ),
                    SizedBox(width: 2.w),
                    Icon(
                      isRtl
                          ? Icons.chevron_left_rounded
                          : Icons.chevron_right_rounded,
                      size: 18.sp,
                      color: AppColors.orangeBadge,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 14.h),
          AppSegmentedToggle<int>(
            height: 40.h,
            borderRadius: 12.0,
            fontSize: 12.0,
            selectedValue: _selectedPeriod,
            onChanged: (value) => setState(() => _selectedPeriod = value),
            options: [
              AppToggleOption<int>(value: 0, label: s.week),
              AppToggleOption<int>(value: 1, label: s.month),
              AppToggleOption<int>(value: 2, label: s.threeMonths),
            ],
          ),
          SizedBox(height: 14.h),
          const HomeHealthChartLegend(),
          SizedBox(height: 14.h),
          SizedBox(
            height: 130.h,
            width: double.infinity,
            child: LineChart(
              buildHomeHealthChartData(
                selectedPeriod: _selectedPeriod,
                colors: colors,
                textTheme: textTheme,
              ),
              duration: const Duration(milliseconds: 420),
              curve: Curves.easeOutCubic,
            ),
          ),
          SizedBox(height: 8.h),
          const HomeChartDaysRow(),
          SizedBox(height: 10.h),
          Center(
            child: Text(
              s.chartDisclaimer,
              textAlign: TextAlign.center,
              style: textTheme.labelSmall?.copyWith(fontSize: 9.5.sp),
            ),
          ),
        ],
      ),
    );
  }
}
