import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';

class ReportMetricCard extends StatelessWidget {
  final String label;
  final String value;
  final String unit;

  const ReportMetricCard({
    super.key,
    required this.label,
    required this.value,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final textTheme = context.textTheme;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: colors.cardBackground,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            label,
            style: textTheme.labelSmall?.copyWith(
              fontSize: 11.sp,
              color: colors.secondaryText,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            value,
            style: textTheme.titleLarge?.copyWith(
              fontSize: 19.sp,
              fontWeight: FontWeight.bold,
              color: colors.brandNavy,
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            unit,
            style: textTheme.labelSmall?.copyWith(
              fontSize: 10.5.sp,
              color: colors.secondaryText,
            ),
          ),
        ],
      ),
    );
  }
}

class ReportIncludesCard extends StatelessWidget {
  final String title;
  final List<String> items;

  const ReportIncludesCard({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final textTheme = context.textTheme;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(18.r),
      decoration: BoxDecoration(
        color: colors.cardBackground,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: 12,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: textTheme.titleSmall?.copyWith(
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
              color: colors.brandNavy,
            ),
          ),
          SizedBox(height: 12.h),
          ...items.map(
            (text) => Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: Row(
                children: [
                  Icon(
                    Icons.check_rounded,
                    color: AppColors.successGreen,
                    size: 18.sp,
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Text(
                      text,
                      style: textTheme.bodySmall?.copyWith(
                        fontSize: 12.5.sp,
                        color: colors.secondaryText,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
