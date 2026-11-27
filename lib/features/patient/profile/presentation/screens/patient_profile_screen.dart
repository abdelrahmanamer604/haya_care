import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/routing/routes.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/app_feedback.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/core/utils/responsive.dart';
import 'package:haya_care/core/widgets/sticky_pull_header_scroll_view.dart';
import 'package:haya_care/features/patient/doctors/presentation/widgets/doctors_brand_header.dart';
import 'package:haya_care/features/patient/profile/presentation/controllers/patient_profile_controller.dart';
import 'package:haya_care/features/patient/profile/presentation/widgets/main/profile_edit_personal_card.dart';
import 'package:haya_care/features/patient/profile/presentation/widgets/main/profile_logout_button.dart';
import 'package:haya_care/features/patient/profile/presentation/widgets/main/profile_menu_card.dart';
import 'package:haya_care/features/patient/profile/presentation/widgets/main/profile_preferences_card.dart';
import 'package:haya_care/features/patient/profile/presentation/widgets/main/profile_privacy_card.dart';
import 'package:haya_care/features/patient/profile/presentation/widgets/main/profile_security_sheets.dart';
import 'package:haya_care/features/patient/profile/presentation/widgets/main/profile_user_banner.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class PatientProfileScreen extends StatefulWidget {
  const PatientProfileScreen({super.key});

  @override
  State<PatientProfileScreen> createState() => _PatientProfileScreenState();
}

class _PatientProfileScreenState extends State<PatientProfileScreen> {
  final PatientProfileController _controller = PatientProfileController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller.initIfNeeded(S.of(context)!);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _confirmSignOut(BuildContext context, S s) async {
    final confirmed = await AppFeedback.showConfirmDialog(
      context,
      title: s.signOutConfirmTitle,
      message: s.signOutConfirmMessage,
      confirmLabel: s.signOut,
      cancelLabel: s.cancelButton,
      confirmColor: AppColors.heartRateRed,
    );
    if (confirmed && context.mounted) {
      Navigator.of(context).pushNamedAndRemoveUntil(Routes.login, (_) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final colors = context.appColors;
    final textTheme = context.textTheme;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        body: SafeArea(
          bottom: false,
          child: AdaptiveScaffoldWrapper(
            maxContentWidth: 440,
            child: ListenableBuilder(
              listenable: _controller,
              builder: (context, _) => StickyPullHeaderScrollView(
                headerHeight: 48,
                header: const DoctorsBrandHeader(),
                children: [
                  SizedBox(height: 10.h),
                  Text(s.profileNav, style: textTheme.headlineMedium?.copyWith(fontSize: 24.sp, fontWeight: FontWeight.bold, color: colors.brandNavy)),
                  SizedBox(height: 2.h),
                  Text(s.profileSubtitle, style: textTheme.bodySmall?.copyWith(fontSize: 12.sp, color: colors.secondaryText)),
                  SizedBox(height: 16.h),
                  ProfileUserBanner(
                    name: _controller.userName,
                    email: _controller.userEmail,
                    initials: _controller.userInitials,
                    onEditTap: _controller.startEditingPersonalInfo,
                  ),
                  if (_controller.isEditingPersonalInfo) ...[
                    SizedBox(height: 12.h),
                    ProfileEditPersonalCard(
                      initialName: _controller.userName,
                      initialEmail: _controller.userEmail,
                      onCancel: _controller.cancelEditingPersonalInfo,
                      onSave: (name, email) {
                        _controller.savePersonalInfo(name, email);
                        AppFeedback.showSuccess(context, s.personalInfoUpdatedSuccess);
                      },
                    ),
                  ],
                  SizedBox(height: 16.h),
                  ProfileMenuCard(
                    items: [
                      ProfileMenuItemData(icon: Icons.favorite_border_rounded, title: s.medicalRecordTitle, subtitle: s.medicalRecordSubtitle, onTap: () => context.pushNamed(Routes.medicalRecord)),
                      ProfileMenuItemData(icon: Icons.description_outlined, title: s.medicalReportsTitle, subtitle: s.medicalReportsSubtitle, onTap: () => context.pushNamed(Routes.patientReports)),
                      ProfileMenuItemData(icon: Icons.person_outline_rounded, title: s.familyEmergencyTitle, subtitle: s.familyEmergencySubtitle, onTap: () => context.pushNamed(Routes.familyEmergency)),
                      ProfileMenuItemData(icon: Icons.spa_outlined, title: s.healthTipsTitle, subtitle: s.healthTipsSubtitle, onTap: () => context.pushNamed(Routes.patientHealthTips)),
                      ProfileMenuItemData(icon: Icons.tune_rounded, title: s.personalThresholdsTitle, subtitle: s.personalThresholdsSubtitle, onTap: () => showPersonalThresholdsSheet(context)),
                      ProfileMenuItemData(icon: Icons.shield_outlined, title: s.securitySessionsTitle, subtitle: s.securitySessionsSubtitle, onTap: () => showSecuritySessionsSheet(context)),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  ProfilePreferencesCard(remindersEnabled: _controller.remindersEnabled, onRemindersChanged: _controller.setReminders),
                  SizedBox(height: 16.h),
                  ProfilePrivacyCard(shareHealthData: _controller.shareHealthData, assistantAccess: _controller.assistantAccess, onShareHealthChanged: _controller.setShareHealthData, onAssistantAccessChanged: _controller.setAssistantAccess),
                  SizedBox(height: 16.h),
                  ProfileLogoutButton(onPressed: () => _confirmSignOut(context, s)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
