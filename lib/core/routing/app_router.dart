import 'package:flutter/material.dart';
import 'package:haya_care/core/routing/routes.dart';
import 'package:haya_care/features/admin/navigation/presentation/screens/admin_navigation_screen.dart';
import 'package:haya_care/features/auth/presentation/screens/email_verification_screen.dart';
import 'package:haya_care/features/auth/presentation/screens/login_screen.dart';
import 'package:haya_care/features/auth/presentation/screens/password_recovery_screen.dart';
import 'package:haya_care/features/auth/presentation/screens/register_screen.dart';
import 'package:haya_care/features/auth/presentation/screens/set_new_password_screen.dart';
import 'package:haya_care/features/doctor/navigation/presentation/screens/doctor_navigation_screen.dart';
import 'package:haya_care/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:haya_care/features/splash/presentation/screens/splash_screen.dart';

class AppRouter {
  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initial:
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case Routes.onboarding:
        return _fadeRoute(settings, const OnboardingScreen(), 500);

      case Routes.login:
        return _fadeRoute(settings, const LoginScreen(), 500);

      case Routes.register:
        return _fadeRoute(settings, const RegisterScreen(), 500);

      case Routes.passwordRecovery:
        return MaterialPageRoute(builder: (_) => const PasswordRecoveryScreen());

      case Routes.setNewPassword:
        return MaterialPageRoute(builder: (_) => const SetNewPasswordScreen());

      case Routes.emailVerification:
        return MaterialPageRoute(builder: (_) => const EmailVerificationScreen());

      case Routes.home:
      case Routes.patientHome:
      case Routes.patientNotifications:
      case Routes.patientAnalytics:
      case Routes.doctorProfile:
      case Routes.doctorChat:
      case Routes.medicalRecord:
      case Routes.patientMedications:
      case Routes.patientReports:
      case Routes.patientMessages:
      case Routes.familyEmergency:
      case Routes.patientHealthTips:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text(settings.name ?? '')),
          ),
        );

      case Routes.doctorHome:
        return _fadeRoute(settings, const DoctorNavigationScreen(), 400);

      case Routes.adminHome:
        return _fadeRoute(settings, const AdminNavigationScreen(), 400);

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }

  PageRouteBuilder<dynamic> _fadeRoute(RouteSettings settings, Widget page, int ms) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (_, _, _) => page,
      transitionsBuilder: (_, animation, _, child) => FadeTransition(opacity: animation, child: child),
      transitionDuration: Duration(milliseconds: ms),
    );
  }
}
