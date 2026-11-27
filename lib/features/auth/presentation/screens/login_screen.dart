import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/routing/routes.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/core/utils/responsive.dart';
import 'package:haya_care/features/auth/presentation/widgets/auth_background_bubbles.dart';
import 'package:haya_care/features/auth/presentation/widgets/auth_brand_header.dart';
import 'package:haya_care/features/auth/presentation/widgets/auth_security_footer.dart';
import 'package:haya_care/features/auth/presentation/widgets/login/login_buttons.dart';
import 'package:haya_care/features/auth/presentation/widgets/login/login_form.dart';
import 'package:haya_care/features/auth/presentation/widgets/login/login_header.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordObscured = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        body: AuthBackgroundBubbles(
          child: SafeArea(
          child: AdaptiveScaffoldWrapper(
            maxContentWidth: 440,
            child: Center(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const AuthBrandHeader(),
                    SizedBox(height: 20.h),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 24.h,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardTheme.color,
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
                          const LoginHeader(),
                          SizedBox(height: 20.h),
                          LoginForm(
                            emailController: _emailController,
                            passwordController: _passwordController,
                            isPasswordObscured: _isPasswordObscured,
                            onTogglePasswordVisibility: () {
                              setState(() {
                                _isPasswordObscured = !_isPasswordObscured;
                              });
                            },
                            onForgotPasswordTap: () {
                              Navigator.of(context)
                                  .pushNamed(Routes.passwordRecovery);
                            },
                          ),
                          SizedBox(height: 20.h),
                          LoginButtons(
                            onLoginPressed: () {
                              final email =
                                  _emailController.text.trim().toLowerCase();
                              final targetRoute = email.contains('doctor')
                                  ? Routes.doctorHome
                                  : email.contains('admin')
                                      ? Routes.adminHome
                                      : Routes.patientHome;
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                targetRoute,
                                (route) => false,
                              );
                            },
                            onRegisterPressed: () {
                              Navigator.of(context)
                                  .pushReplacementNamed(Routes.register);
                            },
                          ),
                        ],
                      ),
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
