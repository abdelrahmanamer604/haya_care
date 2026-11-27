import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';

class MedicalRecordSectionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String actionLabel;
  final VoidCallback? onActionTap;
  final Color? iconBgColor;
  final Color? iconColor;
  final Widget child;

  const MedicalRecordSectionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.actionLabel,
    required this.child,
    this.onActionTap,
    this.iconBgColor,
    this.iconColor,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40.r,
                height: 40.r,
                decoration: BoxDecoration(
                  color: iconBgColor ?? colors.orangeSurface,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                alignment: Alignment.center,
                child: Icon(
                  icon,
                  color: iconColor ?? AppColors.orangeBadge,
                  size: 20.sp,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Text(
                  title,
                  style: textTheme.titleSmall?.copyWith(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: colors.brandNavy,
                  ),
                ),
              ),
              GestureDetector(
                onTap: onActionTap,
                child: Text(
                  actionLabel,
                  style: textTheme.labelMedium?.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.orangeBadge,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          child,
        ],
      ),
    );
  }
}
