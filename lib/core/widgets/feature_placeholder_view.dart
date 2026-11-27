import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class FeaturePlaceholderView extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color? accentColor;
  final Color? accentBgColor;

  const FeaturePlaceholderView({
    super.key,
    required this.title,
    required this.icon,
    this.accentColor,
    this.accentBgColor,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final theme = context.theme;
    final textTheme = context.textTheme;
    final colors = context.appColors;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 14.h, 20.w, 0),
              child: SizedBox(
                height: 42.r,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                    Container(
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
                      child: Icon(icon, color: colors.brandNavy, size: 21.sp),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 72.r,
                        height: 72.r,
                        decoration: BoxDecoration(
                          color: accentBgColor ?? colors.navySurface,
                          borderRadius: BorderRadius.circular(22.r),
                        ),
                        alignment: Alignment.center,
                        child: Icon(
                          icon,
                          size: 34.sp,
                          color: accentColor ?? colors.brandNavy,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: textTheme.headlineMedium?.copyWith(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        s.comingSoon,
                        textAlign: TextAlign.center,
                        style: textTheme.bodySmall?.copyWith(
                          fontSize: 13.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
