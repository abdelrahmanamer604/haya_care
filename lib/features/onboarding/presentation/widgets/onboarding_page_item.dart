import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/utils/extensions.dart';

class OnboardingPageItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final Widget? extraContent;

  const OnboardingPageItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    this.extraContent,
  });

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.orientationOf(context) == Orientation.landscape;
    final textTheme = context.textTheme;

    if (isLandscape) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24.r),
                child: Image.asset(
                  imagePath,
                  height: 220,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(width: 20.w),
            Expanded(
              flex: 5,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: textTheme.headlineMedium?.copyWith(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      subtitle,
                      textAlign: TextAlign.center,
                      style: textTheme.bodySmall?.copyWith(
                        fontSize: 12.sp,
                        height: 1.5,
                      ),
                    ),
                    if (extraContent != null) ...[
                      SizedBox(height: 12.h),
                      extraContent!,
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(28.r),
              child: Image.asset(
                imagePath,
                width: double.infinity,
                height: 250.h,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            child: Column(
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: textTheme.headlineMedium?.copyWith(
                    fontSize: 21.sp,
                    fontWeight: FontWeight.bold,
                    color: context.appColors.brandNavy,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: textTheme.bodySmall?.copyWith(
                    fontSize: 12.sp,
                    color: context.appColors.secondaryText,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          if (extraContent != null) ...[
            SizedBox(height: 16.h),
            extraContent!,
          ],
        ],
      ),
    );
  }
}
