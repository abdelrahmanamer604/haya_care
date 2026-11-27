import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class AnalyticsMetricStatsRow extends StatelessWidget {
  final String avgValue;
  final String minValue;
  final String maxValue;

  const AnalyticsMetricStatsRow({
    super.key,
    required this.avgValue,
    required this.minValue,
    required this.maxValue,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final colors = context.appColors;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 8.w),
      decoration: BoxDecoration(
        color: colors.inputBackground,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        children: [
          Expanded(child: _StatItem(label: s.averageLabel, value: avgValue)),
          Container(width: 1, height: 28.h, color: colors.borderColor),
          Expanded(child: _StatItem(label: s.minLabel, value: minValue)),
          Container(width: 1, height: 28.h, color: colors.borderColor),
          Expanded(child: _StatItem(label: s.maxLabel, value: maxValue)),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;

  const _StatItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colors = context.appColors;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: textTheme.labelSmall?.copyWith(
            fontSize: 10.sp,
            color: colors.secondaryText,
          ),
        ),
        SizedBox(height: 2.h),
        Text(
          value,
          style: textTheme.labelMedium?.copyWith(
            fontSize: 13.5.sp,
            fontWeight: FontWeight.bold,
            color: colors.brandNavy,
          ),
        ),
      ],
    );
  }
}
