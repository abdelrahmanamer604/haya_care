import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';

class VitalsHeader extends StatelessWidget {
  final VoidCallback? onAnalyticsTap;

  const VitalsHeader({super.key, this.onAnalyticsTap});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final textTheme = context.textTheme;
    final colors = context.appColors;

    return SizedBox(
      height: 42.r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Logo (start side: right in RTL, left in LTR)
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.favorite_border_rounded,
              color: AppColors.orangeBadge,
              size: 20.sp,
            ),
            SizedBox(width: 6.w),
            RichText(
              text: TextSpan(
                style: textTheme.headlineMedium?.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: colors.primaryText,
                ),
                children: [
                  const TextSpan(text: 'Haya'),
                  TextSpan(
                    text: 'Care',
                    style: textTheme.headlineMedium?.copyWith(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.orangeBadge,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        // Chart badge (end side: left in RTL, right in LTR)
        GestureDetector(
          onTap: onAnalyticsTap,
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
              Icons.bar_chart_rounded,
              color: colors.brandNavy,
              size: 21.sp,
            ),
          ),
        ),
      ],
    ),
    );
  }
}
