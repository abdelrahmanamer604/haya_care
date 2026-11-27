import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/core/widgets/app_button.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class RegisterActions extends StatelessWidget {
  final bool isDoctor;
  final VoidCallback onRegisterPressed;
  final VoidCallback onLoginPressed;

  const RegisterActions({
    super.key,
    required this.isDoctor,
    required this.onRegisterPressed,
    required this.onLoginPressed,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        AppButton(
          text: isDoctor ? s.submitDoctorRegistration : s.createAccountShort,
          trailingIcon: Icons.check_rounded,
          onPressed: onRegisterPressed,
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              s.alreadyHaveAccount,
              style: textTheme.bodySmall?.copyWith(
                fontSize: 13.sp,
                color: context.appColors.secondaryText,
              ),
            ),
            SizedBox(width: 4.w),
            GestureDetector(
              onTap: onLoginPressed,
              child: Text(
                s.login,
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
