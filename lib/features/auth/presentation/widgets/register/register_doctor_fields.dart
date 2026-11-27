import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/features/auth/presentation/widgets/register/register_doctor_extra_section.dart';
import 'package:haya_care/features/auth/presentation/widgets/register/register_labeled_field.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class RegisterDoctorFields extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController specialtyController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController experienceController;
  final TextEditingController licenseController;
  final TextEditingController hospitalController;

  const RegisterDoctorFields({
    super.key,
    required this.nameController,
    required this.phoneController,
    required this.emailController,
    required this.specialtyController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.experienceController,
    required this.licenseController,
    required this.hospitalController,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RegisterLabeledField(
          label: s.fullName,
          hint: s.fullNameNewHint,
          controller: nameController,
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              child: RegisterLabeledField(
                label: s.phoneNumber,
                hint: s.phoneNewHint,
                controller: phoneController,
                keyboardType: TextInputType.phone,
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: RegisterLabeledField(
                label: s.email,
                hint: s.emailNewHint,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              child: RegisterLabeledField(
                label: s.password,
                hint: s.passwordNewHint,
                controller: passwordController,
                isPassword: true,
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: RegisterLabeledField(
                label: s.confirmPassword,
                hint: s.confirmPasswordNewHint,
                controller: confirmPasswordController,
                isPassword: true,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        RegisterDoctorExtraSection(
          specialtyController: specialtyController,
          experienceController: experienceController,
          licenseController: licenseController,
          hospitalController: hospitalController,
        ),
      ],
    );
  }
}
