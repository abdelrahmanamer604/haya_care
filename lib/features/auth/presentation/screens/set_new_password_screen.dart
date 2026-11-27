import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/routing/routes.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/core/utils/responsive.dart';
import 'package:haya_care/features/auth/presentation/widgets/auth_background_bubbles.dart';
import 'package:haya_care/features/auth/presentation/widgets/auth_security_footer.dart';
import 'package:haya_care/features/auth/presentation/widgets/auth_top_bar_with_back.dart';
import 'package:haya_care/features/auth/presentation/widgets/set_new_password/set_new_password_card.dart';

class SetNewPasswordScreen extends StatefulWidget {
  const SetNewPasswordScreen({super.key});

  @override
  State<SetNewPasswordScreen> createState() => _SetNewPasswordScreenState();
}

class _SetNewPasswordScreenState extends State<SetNewPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isPasswordObscured = true;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AuthTopBarWithBack(
                      onBack: () => Navigator.of(context).pop(),
                    ),
                    SizedBox(height: 20.h),
                    SetNewPasswordCard(
                      passwordController: _passwordController,
                      confirmPasswordController: _confirmPasswordController,
                      isPasswordObscured: _isPasswordObscured,
                      onTogglePasswordVisibility: () {
                        setState(() {
                          _isPasswordObscured = !_isPasswordObscured;
                        });
                      },
                      onUpdatePassword: () {
                        Navigator.of(context)
                            .pushReplacementNamed(Routes.login);
                      },
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
