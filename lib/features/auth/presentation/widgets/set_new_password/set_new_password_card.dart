import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/core/widgets/app_button.dart';
import 'package:haya_care/core/widgets/app_text_field.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class SetNewPasswordCard extends StatelessWidget {
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final bool isPasswordObscured;
  final VoidCallback onTogglePasswordVisibility;
  final VoidCallback onUpdatePassword;

  const SetNewPasswordCard({
    super.key,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.isPasswordObscured,
    required this.onTogglePasswordVisibility,
    required this.onUpdatePassword,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final textTheme = context.textTheme;
    final colors = context.appColors;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
      decoration: BoxDecoration(
        color: context.theme.cardTheme.color,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: const [
          BoxShadow(
              color: AppColors.shadowColor, blurRadius: 16, offset: Offset(0, 4)),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 54.w,
            height: 54.h,
            decoration: BoxDecoration(
                color: colors.orangeSurface,
                borderRadius: BorderRadius.circular(16.r)),
            alignment: Alignment.center,
            child: Icon(Icons.lock_outline_rounded,
                color: AppColors.orangeBadge, size: 26.sp),
          ),
          SizedBox(height: 14.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
            decoration: BoxDecoration(
                color: colors.greenSurface,
                borderRadius: BorderRadius.circular(20.r)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.check_rounded,
                    color: AppColors.successGreen, size: 14.sp),
                SizedBox(width: 4.w),
                Text(
                  s.resetLinkVerified,
                  style: textTheme.labelSmall?.copyWith(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.successGreen),
                ),
              ],
            ),
          ),
          SizedBox(height: 14.h),
          Text(
            s.setNewPasswordTitle,
            textAlign: TextAlign.center,
            style: textTheme.headlineMedium?.copyWith(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
              color: colors.brandNavy,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            s.setNewPasswordSubtitle,
            textAlign: TextAlign.center,
            style: textTheme.bodySmall?.copyWith(
              fontSize: 12.sp,
              color: colors.secondaryText,
              height: 1.5,
            ),
          ),
          SizedBox(height: 22.h),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              s.newPassword,
              style: textTheme.labelMedium
                  ?.copyWith(fontSize: 13.sp, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 8.h),
          AppTextField(
            controller: passwordController,
            obscureText: isPasswordObscured,
            hintText: s.passwordNewHint,
            prefixIcon: Icons.lock_outline_rounded,
            suffixIcon: IconButton(
              icon: Icon(
                isPasswordObscured
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: colors.secondaryText,
                size: 20.sp,
              ),
              onPressed: onTogglePasswordVisibility,
            ),
          ),
          SizedBox(height: 14.h),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              s.confirmPassword,
              style: textTheme.labelMedium
                  ?.copyWith(fontSize: 13.sp, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 8.h),
          AppTextField(
            controller: confirmPasswordController,
            obscureText: isPasswordObscured,
            hintText: s.confirmPasswordNewHint,
            prefixIcon: Icons.lock_outline_rounded,
          ),
          SizedBox(height: 22.h),
          AppButton(
            text: s.updatePasswordButton,
            trailingIcon: Icons.check_rounded,
            onPressed: onUpdatePassword,
          ),
        ],
      ),
    );
  }
}
