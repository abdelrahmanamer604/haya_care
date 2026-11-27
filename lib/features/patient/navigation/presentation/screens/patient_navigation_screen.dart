import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/features/patient/ai_assistant/presentation/widgets/patient_ai_assistant_sheet.dart';
import 'package:haya_care/features/patient/doctors/presentation/screens/patient_doctors_screen.dart';
import 'package:haya_care/features/patient/home/presentation/screens/patient_home_screen.dart';
import 'package:haya_care/features/patient/navigation/presentation/widgets/patient_ai_fab.dart';
import 'package:haya_care/features/patient/navigation/presentation/widgets/patient_bottom_nav_bar.dart';
import 'package:haya_care/features/patient/profile/presentation/screens/patient_medications_screen.dart';
import 'package:haya_care/features/patient/profile/presentation/screens/patient_profile_screen.dart';
import 'package:haya_care/features/patient/vitals/data/models/vital_reading_model.dart';
import 'package:haya_care/features/patient/vitals/presentation/controllers/patient_vitals_controller.dart';
import 'package:haya_care/features/patient/vitals/presentation/screens/patient_vitals_screen.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class PatientNavigationScreen extends StatefulWidget {
  const PatientNavigationScreen({super.key});

  @override
  State<PatientNavigationScreen> createState() =>
      _PatientNavigationScreenState();
}

class _PatientNavigationScreenState extends State<PatientNavigationScreen> {
  int _currentIndex = 0;
  final PatientVitalsController _vitalsController = PatientVitalsController();

  @override
  void dispose() {
    _vitalsController.dispose();
    super.dispose();
  }

  void _openVitals(VitalCategory? category) {
    if (category != null) {
      _vitalsController.selectCategory(category);
    }
    setState(() => _currentIndex = 1);
  }

  Future<void> _showExitConfirmationDialog() async {
    final s = S.of(context)!;
    final textTheme = context.textTheme;
    final colors = context.appColors;

    final shouldExit = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: colors.cardBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        title: Text(
          s.exitAppTitle,
          style: textTheme.titleMedium?.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: colors.brandNavy,
          ),
        ),
        content: Text(
          s.exitAppMessage,
          style: textTheme.bodySmall?.copyWith(
            fontSize: 13.5.sp,
            color: colors.secondaryText,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text(
              s.stayButton,
              style: textTheme.labelMedium?.copyWith(
                color: colors.brandNavy,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text(
              s.exitButton,
              style: textTheme.labelMedium?.copyWith(
                color: AppColors.orangeBadge,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );

    if (shouldExit == true) {
      await SystemNavigator.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      PatientHomeScreen(
        onOpenVitals: _openVitals,
        onOpenProfile: () => setState(() => _currentIndex = 4),
      ),
      PatientVitalsScreen(controller: _vitalsController),
      const PatientMedicationsScreen(),
      const PatientDoctorsScreen(),
      const PatientProfileScreen(),
    ];

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        if (_currentIndex != 0) {
          setState(() => _currentIndex = 0);
        } else {
          _showExitConfirmationDialog();
        }
      },
      child: Scaffold(
        extendBody: true,
        backgroundColor: context.theme.scaffoldBackgroundColor,
        body: IndexedStack(
          index: _currentIndex,
          children: screens,
        ),
        floatingActionButton: PatientAiFab(
          onTap: () => showPatientAiAssistantSheet(context),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        bottomNavigationBar: PatientBottomNavBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
