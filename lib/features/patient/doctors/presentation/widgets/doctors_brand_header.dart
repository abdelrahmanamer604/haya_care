import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';

class DoctorsBrandHeader extends StatelessWidget {
  const DoctorsBrandHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final textTheme = context.textTheme;

    return SizedBox(
      height: 42.r,
      child: Row(
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
    );
  }
}
