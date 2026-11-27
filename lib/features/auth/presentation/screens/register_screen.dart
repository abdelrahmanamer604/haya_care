import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/core/utils/responsive.dart';
import 'package:haya_care/features/auth/presentation/widgets/auth_background_bubbles.dart';
import 'package:haya_care/features/auth/presentation/widgets/auth_brand_header.dart';
import 'package:haya_care/features/auth/presentation/widgets/auth_security_footer.dart';
import 'package:haya_care/features/auth/presentation/widgets/register/register_form_card.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isDoctor = false;

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _specialtyController = TextEditingController();
  final _experienceController = TextEditingController();
  final _licenseController = TextEditingController();
  final _hospitalController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _specialtyController.dispose();
    _experienceController.dispose();
    _licenseController.dispose();
    _hospitalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      behavior: HitTestBehavior.opaque,
      child: Scaffold(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        body: AuthBackgroundBubbles(
          child: SafeArea(
            child: AdaptiveScaffoldWrapper(
              maxContentWidth: 440,
              child: Center(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const AuthBrandHeader(),
                      SizedBox(height: 20.h),
                      RegisterFormCard(
                        isDoctor: _isDoctor,
                        onTypeChanged: (v) => setState(() => _isDoctor = v),
                        nameController: _nameController,
                        phoneController: _phoneController,
                        emailController: _emailController,
                        passwordController: _passwordController,
                        confirmPasswordController: _confirmPasswordController,
                        specialtyController: _specialtyController,
                        experienceController: _experienceController,
                        licenseController: _licenseController,
                        hospitalController: _hospitalController,
                      ),
                      SizedBox(height: 20.h),
                      const AuthSecurityFooter(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
