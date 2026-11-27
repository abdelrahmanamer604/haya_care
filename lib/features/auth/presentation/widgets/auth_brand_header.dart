import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';

class AuthBrandHeader extends StatelessWidget {
  const AuthBrandHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colors = context.appColors;

    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite_border_rounded,
            color: AppColors.orangeBadge,
            size: 26.sp,
          ),
          SizedBox(width: 8.w),
          RichText(
            text: TextSpan(
              style: textTheme.headlineMedium?.copyWith(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                color: colors.primaryText,
              ),
              children: [
                const TextSpan(text: 'Haya'),
                TextSpan(
                  text: 'Care',
                  style: textTheme.headlineMedium?.copyWith(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.orangeBadge,
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
