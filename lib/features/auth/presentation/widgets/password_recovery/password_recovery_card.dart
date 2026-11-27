import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/core/widgets/app_button.dart';
import 'package:haya_care/core/widgets/app_text_field.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class PasswordRecoveryCard extends StatelessWidget {
  final TextEditingController emailController;
  final VoidCallback onSendPressed;

  const PasswordRecoveryCard({
    super.key,
    required this.emailController,
    required this.onSendPressed,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final colors = context.appColors;
    final textTheme = context.textTheme;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
      decoration: BoxDecoration(
        color: context.theme.cardTheme.color,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: 16,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 54.w,
            height: 54.h,
            decoration: BoxDecoration(
              color: colors.orangeSurface,
              borderRadius: BorderRadius.circular(16.r),
            ),
            alignment: Alignment.center,
            child: Icon(
              Icons.lock_outline_rounded,
              color: AppColors.orangeBadge,
              size: 26.sp,
            ),
          ),
          SizedBox(height: 18.h),
          Text(
            s.passwordRecoveryTitle,
            textAlign: TextAlign.center,
            style: textTheme.headlineMedium?.copyWith(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
              color: colors.brandNavy,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            s.passwordRecoverySubtitle,
            textAlign: TextAlign.center,
            style: textTheme.bodySmall?.copyWith(
              fontSize: 12.sp,
              color: colors.secondaryText,
              height: 1.5,
            ),
          ),
          SizedBox(height: 24.h),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              s.email,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          SizedBox(height: 8.h),
          AppTextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            hintText: s.emailNewHint,
            prefixIcon: Icons.mail_outline_rounded,
          ),
          SizedBox(height: 22.h),
          AppButton(
            text: s.sendResetLink,
            useAutoChevron: true,
            onPressed: onSendPressed,
          ),
        ],
      ),
    );
  }
}
