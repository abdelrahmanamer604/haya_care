import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/widgets/app_text_field.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class RegisterPatientFields extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  const RegisterPatientFields({
    super.key,
    required this.nameController,
    required this.phoneController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInputField(
          textTheme: textTheme,
          label: s.fullName,
          hint: s.fullNameNewHint,
          controller: nameController,
        ),
        SizedBox(height: 14.h),
        Row(
          children: [
            Expanded(
              child: _buildInputField(
                textTheme: textTheme,
                label: s.phoneNumber,
                hint: s.phoneNewHint,
                controller: phoneController,
                keyboardType: TextInputType.phone,
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: _buildInputField(
                textTheme: textTheme,
                label: s.email,
                hint: s.emailNewHint,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),
            ),
          ],
        ),
        SizedBox(height: 14.h),
        Row(
          children: [
            Expanded(
              child: _buildInputField(
                textTheme: textTheme,
                label: s.password,
                hint: s.passwordNewHint,
                controller: passwordController,
                isPassword: true,
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: _buildInputField(
                textTheme: textTheme,
                label: s.confirmPassword,
                hint: s.confirmPasswordNewHint,
                controller: confirmPasswordController,
                isPassword: true,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInputField({
    required TextTheme textTheme,
    required String label,
    required String hint,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: textTheme.labelMedium?.copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 6.h),
        AppTextField(
          controller: controller,
          keyboardType: keyboardType,
          hintText: hint,
          obscureText: isPassword,
        ),
      ],
    );
  }
}
