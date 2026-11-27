import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/routing/routes.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/core/utils/responsive.dart';
import 'package:haya_care/features/auth/presentation/widgets/auth_background_bubbles.dart';
import 'package:haya_care/features/auth/presentation/widgets/auth_security_footer.dart';
import 'package:haya_care/features/auth/presentation/widgets/auth_top_bar_with_back.dart';
import 'package:haya_care/features/auth/presentation/widgets/password_recovery/password_recovery_card.dart';

class PasswordRecoveryScreen extends StatefulWidget {
  const PasswordRecoveryScreen({super.key});

  @override
  State<PasswordRecoveryScreen> createState() => _PasswordRecoveryScreenState();
}

class _PasswordRecoveryScreenState extends State<PasswordRecoveryScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
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
                    PasswordRecoveryCard(
                      emailController: _emailController,
                      onSendPressed: () {
                        Navigator.of(context)
                            .pushNamed(Routes.emailVerification);
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
