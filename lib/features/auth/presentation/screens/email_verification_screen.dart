import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/routing/routes.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/core/utils/responsive.dart';
import 'package:haya_care/features/auth/presentation/widgets/auth_background_bubbles.dart';
import 'package:haya_care/features/auth/presentation/widgets/auth_security_footer.dart';
import 'package:haya_care/features/auth/presentation/widgets/auth_top_bar_with_back.dart';
import 'package:haya_care/features/auth/presentation/widgets/email_verification/email_verification_card.dart';

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  EmailVerificationCard(
                    onOpenEmail: () {
                      Navigator.of(context)
                          .pushNamed(Routes.setNewPassword);
                    },
                    onBackToLogin: () {
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
    );
  }
}
