import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/routing/routes.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/features/splash/presentation/widgets/splash_bubbles_painter.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 5), () {
      if (mounted) {
        Navigator.of(context).pushReplacementNamed(Routes.onboarding);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final s = S.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.splashBackground,
      body: CustomPaint(
        painter: const SplashBubblesPainter(),
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(flex: 3),
                FadeInDown(
                  duration: const Duration(milliseconds: 1000),
                  child: Pulse(
                    delay: const Duration(milliseconds: 2000),
                    duration: const Duration(milliseconds: 1200),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.favorite_border_rounded,
                          color: AppColors.orangeBadge,
                          size: 38.sp,
                        ),
                        SizedBox(width: 10.w),
                        RichText(
                          text: TextSpan(
                            style: textTheme.headlineMedium?.copyWith(
                              fontSize: 32.sp,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                            children: [
                              TextSpan(
                                text: 'Haya',
                                style: textTheme.headlineMedium?.copyWith(
                                  fontSize: 32.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white,
                                ),
                              ),
                              TextSpan(
                                text: 'Care',
                                style: textTheme.headlineMedium?.copyWith(
                                  fontSize: 32.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.orangeBadge,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                FadeInUp(
                  delay: const Duration(milliseconds: 1000),
                  duration: const Duration(milliseconds: 800),
                  child: Text(
                    s.splashSubtitle,
                    textAlign: TextAlign.center,
                    style: textTheme.bodyMedium?.copyWith(
                      color: AppColors.splashSubtitleText,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                const Spacer(flex: 3),
                FadeInUp(
                  delay: const Duration(milliseconds: 1400),
                  duration: const Duration(milliseconds: 800),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 24.h),
                    child: Text(
                      s.splashFooter,
                      textAlign: TextAlign.center,
                      style: textTheme.bodySmall?.copyWith(
                        color: AppColors.splashFooterText,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
