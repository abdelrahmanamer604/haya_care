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
import 'package:haya_care/features/patient/doctors/data/doctors_demo_data.dart';
import 'package:haya_care/features/patient/doctors/data/models/doctor_model.dart';
import 'package:haya_care/features/patient/doctors/presentation/screens/doctor_chat_screen.dart';
import 'package:haya_care/features/patient/doctors/presentation/screens/doctor_profile_screen.dart';
import 'package:haya_care/features/patient/navigation/presentation/screens/patient_navigation_screen.dart';
import 'package:haya_care/features/patient/notifications/presentation/screens/patient_notifications_screen.dart';
import 'package:haya_care/features/patient/profile/presentation/screens/patient_family_emergency_screen.dart';
import 'package:haya_care/features/patient/profile/presentation/screens/patient_health_tips_screen.dart';
import 'package:haya_care/features/patient/profile/presentation/screens/patient_medical_record_screen.dart';
import 'package:haya_care/features/patient/profile/presentation/screens/patient_medical_reports_screen.dart';
import 'package:haya_care/features/patient/profile/presentation/screens/patient_medications_screen.dart';
import 'package:haya_care/features/patient/profile/presentation/screens/patient_messages_screen.dart';
import 'package:haya_care/features/patient/vitals/presentation/screens/patient_analytics_screen.dart';
import 'package:haya_care/features/splash/presentation/screens/splash_screen.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class AppRouter {
  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initial:
      case Routes.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );

      case Routes.onboarding:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, _, _) => const OnboardingScreen(),
          transitionsBuilder: (_, animation, _, child) =>
              FadeTransition(opacity: animation, child: child),
          transitionDuration: const Duration(milliseconds: 500),
        );

      case Routes.login:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, _, _) => const LoginScreen(),
          transitionsBuilder: (_, animation, _, child) =>
              FadeTransition(opacity: animation, child: child),
          transitionDuration: const Duration(milliseconds: 500),
        );

      case Routes.register:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, _, _) => const RegisterScreen(),
          transitionsBuilder: (_, animation, _, child) =>
              FadeTransition(opacity: animation, child: child),
          transitionDuration: const Duration(milliseconds: 500),
        );

      case Routes.passwordRecovery:
        return MaterialPageRoute(
          builder: (_) => const PasswordRecoveryScreen(),
        );

      case Routes.setNewPassword:
        return MaterialPageRoute(
          builder: (_) => const SetNewPasswordScreen(),
        );

      case Routes.emailVerification:
        return MaterialPageRoute(
          builder: (_) => const EmailVerificationScreen(),
        );

      case Routes.home:
      case Routes.patientHome:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, _, _) => const PatientNavigationScreen(),
          transitionsBuilder: (_, animation, _, child) =>
              FadeTransition(opacity: animation, child: child),
          transitionDuration: const Duration(milliseconds: 400),
        );

      case Routes.patientNotifications:
        return MaterialPageRoute(builder: (_) => const PatientNotificationsScreen());
      case Routes.patientAnalytics:
        return MaterialPageRoute(builder: (_) => const PatientAnalyticsScreen());

      case Routes.doctorProfile:
        final arg = settings.arguments;
        return MaterialPageRoute(
          builder: (context) => DoctorProfileScreen(
            doctor: arg is DoctorModel ? arg : getDemoDoctors(S.of(context)!).first,
          ),
        );
      case Routes.doctorChat:
        final arg = settings.arguments;
        return MaterialPageRoute(
          builder: (context) => DoctorChatScreen(
            doctor: arg is DoctorModel ? arg : getDemoDoctors(S.of(context)!).first,
          ),
        );

      case Routes.medicalRecord:
        return MaterialPageRoute(builder: (_) => const PatientMedicalRecordScreen());
      case Routes.patientMedications:
        return MaterialPageRoute(builder: (_) => const PatientMedicationsScreen());
      case Routes.patientReports:
        return MaterialPageRoute(builder: (_) => const PatientMedicalReportsScreen());
      case Routes.patientMessages:
        return MaterialPageRoute(builder: (_) => const PatientMessagesScreen());
      case Routes.familyEmergency:
        return MaterialPageRoute(builder: (_) => const PatientFamilyEmergencyScreen());
      case Routes.patientHealthTips:
        return MaterialPageRoute(builder: (_) => const PatientHealthTipsScreen());

      case Routes.doctorHome:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, _, _) => const DoctorNavigationScreen(),
          transitionsBuilder: (_, animation, _, child) =>
              FadeTransition(opacity: animation, child: child),
          transitionDuration: const Duration(milliseconds: 400),
        );

      case Routes.adminHome:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, _, _) => const AdminNavigationScreen(),
          transitionsBuilder: (_, animation, _, child) =>
              FadeTransition(opacity: animation, child: child),
          transitionDuration: const Duration(milliseconds: 400),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
