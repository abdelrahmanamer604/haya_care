import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final textTheme = context.textTheme;
    final colors = context.appColors;

    return Column(
      children: [
        Text(
          s.welcomeBackTitle,
          textAlign: TextAlign.center,
          style: textTheme.titleSmall?.copyWith(
            color: AppColors.orangeBadge,
            fontSize: 13.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 6.h),
        Text(
          s.login,
          textAlign: TextAlign.center,
          style: textTheme.headlineMedium?.copyWith(
            color: colors.brandNavy,
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 6.h),
        Text(
          s.loginSubtitle,
          textAlign: TextAlign.center,
          style: textTheme.bodySmall?.copyWith(
            color: colors.secondaryText,
            fontSize: 12.sp,
          ),
        ),
      ],
    );
  }
}
