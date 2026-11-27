import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/core/widgets/app_button.dart';
import 'package:haya_care/core/widgets/info_banner.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class LoginButtons extends StatelessWidget {
  final VoidCallback onLoginPressed;
  final VoidCallback onRegisterPressed;
  final VoidCallback? onGoogleSignInPressed;

  const LoginButtons({
    super.key,
    required this.onLoginPressed,
    required this.onRegisterPressed,
    this.onGoogleSignInPressed,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final textTheme = context.textTheme;
    final colors = context.appColors;

    return Column(
      children: [
        AppButton(
          text: s.login,
          useAutoChevron: true,
          onPressed: onLoginPressed,
        ),
        SizedBox(height: 14.h),
        Row(
          children: [
            Expanded(child: Container(height: 1, color: colors.borderColor)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Text(
                s.orDivider,
                style: textTheme.bodySmall?.copyWith(
                  fontSize: 12.sp,
                  color: colors.secondaryText,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(child: Container(height: 1, color: colors.borderColor)),
          ],
        ),
        SizedBox(height: 14.h),
        AppButton(
          text: s.signInWithGoogle,
          variant: AppButtonVariant.outlined,
          leadingAsset: context.googleLogoAsset,
          onPressed: onGoogleSignInPressed ?? () {},
        ),
        SizedBox(height: 16.h),
        InfoBanner(
          text: s.sampleAccounts,
          backgroundColor: colors.navySurface,
          textColor: colors.secondaryText,
          horizontalPadding: 12.w,
          verticalPadding: 10.h,
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              s.dontHaveAccount,
              style: textTheme.bodySmall?.copyWith(
                fontSize: 13.sp,
                color: colors.secondaryText,
              ),
            ),
            SizedBox(width: 4.w),
            GestureDetector(
              onTap: onRegisterPressed,
              child: Text(
                s.createAccountShort,
                style: textTheme.titleSmall?.copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.orangeBadge,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
