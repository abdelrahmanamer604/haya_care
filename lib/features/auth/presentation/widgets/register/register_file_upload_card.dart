import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';

class RegisterFileUploadCard extends StatelessWidget {
  final String title;
  final String hint;
  final String buttonText;
  final VoidCallback? onTap;

  const RegisterFileUploadCard({
    super.key,
    required this.title,
    required this.hint,
    required this.buttonText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colors = context.appColors;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: colors.cardBackground,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: colors.borderColor),
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 36.w,
                  height: 36.h,
                  decoration: BoxDecoration(
                    color: colors.navySurface,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.description_outlined,
                    size: 20.sp,
                    color: AppColors.primaryBlue,
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.labelMedium?.copyWith(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        hint,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.labelSmall?.copyWith(fontSize: 9.sp),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 8.w),
          GestureDetector(
            onTap: onTap ?? () {},
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: colors.orangeSurface,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                buttonText,
                style: textTheme.titleSmall?.copyWith(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.orangeBadge,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
