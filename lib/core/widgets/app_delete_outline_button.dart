import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';

class AppDeleteOutlineButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double borderRadius;

  const AppDeleteOutlineButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.borderRadius = 16,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    return OutlinedButton.icon(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        minimumSize: Size.fromHeight(48.h),
        side: BorderSide(color: AppColors.heartRateRed.withValues(alpha: 0.4)),
        backgroundColor: colors.redSurface.withValues(alpha: 0.35),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
        ),
      ),
      icon: Icon(Icons.delete_outline_rounded, color: AppColors.heartRateRed, size: 18.sp),
      label: Text(
        label,
        style: context.textTheme.labelMedium?.copyWith(
          fontSize: 13.5.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.heartRateRed,
        ),
      ),
    );
  }
}
