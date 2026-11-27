import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/features/patient/vitals/presentation/widgets/analytics/analytics_metric_chart.dart';
import 'package:haya_care/features/patient/vitals/presentation/widgets/analytics/analytics_metric_stats_row.dart';

class AnalyticsMetricCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconColor;
  final String avgValue;
  final String minValue;
  final String maxValue;
  final List<double> primaryPoints;
  final Color primaryLineColor;
  final List<double>? secondaryPoints;
  final Color? secondaryLineColor;
  final double minY;
  final double maxY;
  final List<String> xLabels;

  const AnalyticsMetricCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
    required this.avgValue,
    required this.minValue,
    required this.maxValue,
    required this.primaryPoints,
    required this.primaryLineColor,
    this.secondaryPoints,
    this.secondaryLineColor,
    this.minY = 0,
    this.maxY = 100,
    required this.xLabels,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final textTheme = context.textTheme;
    final colors = context.appColors;

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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: textTheme.labelMedium?.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: colors.brandNavy,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    subtitle,
                    style: textTheme.labelSmall?.copyWith(
                      fontSize: 11.sp,
                      color: colors.secondaryText,
                    ),
                  ),
                ],
              ),
              Icon(icon, color: iconColor, size: 22.sp),
            ],
          ),
          SizedBox(height: 14.h),
          AnalyticsMetricStatsRow(
            avgValue: avgValue,
            minValue: minValue,
            maxValue: maxValue,
          ),
          SizedBox(height: 16.h),
          AnalyticsMetricChart(
            primaryPoints: primaryPoints,
            primaryLineColor: primaryLineColor,
            secondaryPoints: secondaryPoints,
            secondaryLineColor: secondaryLineColor,
            minY: minY,
            maxY: maxY,
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: xLabels
                .map(
                  (label) => Text(
                    label,
                    style: textTheme.labelSmall?.copyWith(
                      fontSize: 9.5.sp,
                      color: colors.secondaryText,
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
