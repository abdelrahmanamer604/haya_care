import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/routing/routes.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/features/auth/presentation/widgets/register/register_actions.dart';
import 'package:haya_care/features/auth/presentation/widgets/register/register_doctor_fields.dart';
import 'package:haya_care/features/auth/presentation/widgets/register/register_header.dart';
import 'package:haya_care/features/auth/presentation/widgets/register/register_patient_fields.dart';
import 'package:haya_care/features/auth/presentation/widgets/register/register_user_type_toggle.dart';

class RegisterFormCard extends StatelessWidget {
  final bool isDoctor;
  final ValueChanged<bool> onTypeChanged;
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController specialtyController;
  final TextEditingController experienceController;
  final TextEditingController licenseController;
  final TextEditingController hospitalController;

  const RegisterFormCard({
    super.key,
    required this.isDoctor,
    required this.onTypeChanged,
    required this.nameController,
    required this.phoneController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.specialtyController,
    required this.experienceController,
    required this.licenseController,
    required this.hospitalController,
  });

  @override
  Widget build(BuildContext context) {
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
        children: [
          RegisterHeader(isDoctor: isDoctor),
          SizedBox(height: 18.h),
          RegisterUserTypeToggle(
            isDoctor: isDoctor,
            onTypeChanged: onTypeChanged,
          ),
          SizedBox(height: 18.h),
          AnimatedSize(
            duration: const Duration(milliseconds: 380),
            curve: Curves.easeOutCubic,
            alignment: Alignment.topCenter,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 380),
              switchInCurve: Curves.easeOutCubic,
              switchOutCurve: Curves.easeInCubic,
              transitionBuilder: (child, animation) {
                final isRtl = context.isRtl;
                final direction = isDoctor
                    ? (isRtl ? -0.06 : 0.06)
                    : (isRtl ? 0.06 : -0.06);
                return FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(direction, 0.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: ScaleTransition(
                      scale: Tween<double>(begin: 0.97, end: 1.0)
                          .animate(animation),
                      child: child,
                    ),
                  ),
                );
              },
              child: !isDoctor
                  ? RegisterPatientFields(
                      key: const ValueKey('patient_fields'),
                      nameController: nameController,
                      phoneController: phoneController,
                      emailController: emailController,
                      passwordController: passwordController,
                      confirmPasswordController: confirmPasswordController,
                    )
                  : RegisterDoctorFields(
                      key: const ValueKey('doctor_fields'),
                      nameController: nameController,
                      phoneController: phoneController,
                      emailController: emailController,
                      specialtyController: specialtyController,
                      passwordController: passwordController,
                      confirmPasswordController: confirmPasswordController,
                      experienceController: experienceController,
                      licenseController: licenseController,
                      hospitalController: hospitalController,
                    ),
            ),
          ),
          SizedBox(height: 22.h),
          RegisterActions(
            isDoctor: isDoctor,
            onRegisterPressed: () {},
            onLoginPressed: () =>
                Navigator.of(context).pushReplacementNamed(Routes.login),
          ),
        ],
      ),
    );
  }
}
