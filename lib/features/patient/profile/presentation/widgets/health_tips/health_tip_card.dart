import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';

class HealthTipCard extends StatelessWidget {
  final IconData icon;
  final String category;
  final String title;
  final String description;

  const HealthTipCard({
    super.key,
    required this.icon,
    required this.category,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final textTheme = context.textTheme;

    return Container(
      padding: EdgeInsets.all(16.r),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44.r,
            height: 44.r,
            decoration: BoxDecoration(
              color: colors.orangeSurface,
              borderRadius: BorderRadius.circular(14.r),
            ),
            alignment: Alignment.center,
            child: Icon(icon, color: AppColors.orangeBadge, size: 22.sp),
          ),
          SizedBox(width: 14.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category,
                  style: textTheme.labelSmall?.copyWith(
                    fontSize: 10.5.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.orangeBadge,
                  ),
                ),
                SizedBox(height: 3.h),
                Text(
                  title,
                  style: textTheme.titleSmall?.copyWith(
                    fontSize: 14.5.sp,
                    fontWeight: FontWeight.bold,
                    color: colors.brandNavy,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  description,
                  style: textTheme.bodySmall?.copyWith(
                    fontSize: 11.5.sp,
                    color: colors.secondaryText,
                    height: 1.45,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
