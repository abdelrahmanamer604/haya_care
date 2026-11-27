import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class OnboardingHeader extends StatelessWidget {
  final bool showSkip;
  final VoidCallback onSkip;

  const OnboardingHeader({
    super.key,
    required this.showSkip,
    required this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final textTheme = context.textTheme;
    final colors = context.appColors;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.favorite_border_rounded,
                color: AppColors.orangeBadge,
                size: 22.sp,
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
          if (showSkip)
            TextButton(
              onPressed: onSkip,
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                s.skip,
                style: textTheme.labelMedium?.copyWith(
                  color: AppColors.orangeBadge,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
              ),
            )
          else
            const SizedBox.shrink(),
        ],
      ),
    );
  }
}
