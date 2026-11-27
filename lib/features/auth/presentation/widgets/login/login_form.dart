import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/core/widgets/app_text_field.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool isPasswordObscured;
  final VoidCallback onTogglePasswordVisibility;
  final VoidCallback onForgotPasswordTap;

  const LoginForm({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.isPasswordObscured,
    required this.onTogglePasswordVisibility,
    required this.onForgotPasswordTap,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          s.email,
          style: textTheme.labelMedium?.copyWith(
            fontSize: 13.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.h),
        AppTextField(
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          hintText: s.loginEmailHint,
          prefixIcon: Icons.mail_outline_rounded,
        ),
        SizedBox(height: 16.h),
        Text(
          s.password,
          style: textTheme.labelMedium?.copyWith(
            fontSize: 13.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.h),
        AppTextField(
          controller: passwordController,
          obscureText: isPasswordObscured,
          hintText: s.loginPasswordHint,
          prefixIcon: Icons.lock_outline_rounded,
          suffixIcon: IconButton(
            icon: Icon(
              isPasswordObscured ? Icons.visibility_outlined : Icons.visibility_off_outlined,
              color: context.appColors.secondaryText,
              size: 20.sp,
            ),
            onPressed: onTogglePasswordVisibility,
          ),
        ),
        SizedBox(height: 12.h),
        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: GestureDetector(
            onTap: onForgotPasswordTap,
            child: Text(
              s.forgotPassword,
              style: textTheme.titleSmall?.copyWith(
                color: AppColors.orangeBadge,
                fontSize: 13.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
