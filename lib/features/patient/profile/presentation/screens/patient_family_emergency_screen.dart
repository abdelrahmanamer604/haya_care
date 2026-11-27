import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/utils/app_feedback.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/core/utils/responsive.dart';
import 'package:haya_care/features/patient/profile/presentation/controllers/family_emergency_controller.dart';
import 'package:haya_care/features/patient/profile/presentation/screens/caregiver_patient_summary_screen.dart';
import 'package:haya_care/features/patient/profile/presentation/widgets/family_emergency/add_family_member_sheet.dart';
import 'package:haya_care/features/patient/profile/presentation/widgets/family_emergency/emergency_consent_and_qr.dart';
import 'package:haya_care/features/patient/profile/presentation/widgets/family_emergency/emergency_full_card_dialog.dart';
import 'package:haya_care/features/patient/profile/presentation/widgets/family_emergency/emergency_info_and_family.dart';
import 'package:haya_care/features/patient/profile/presentation/widgets/family_emergency/emergency_medical_card.dart';
import 'package:haya_care/features/patient/profile/presentation/widgets/family_emergency/monitored_people_section.dart';
import 'package:haya_care/features/patient/profile/presentation/widgets/shared/profile_sub_header.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class PatientFamilyEmergencyScreen extends StatefulWidget {
  const PatientFamilyEmergencyScreen({super.key});

  @override
  State<PatientFamilyEmergencyScreen> createState() =>
      _PatientFamilyEmergencyScreenState();
}

class _PatientFamilyEmergencyScreenState
    extends State<PatientFamilyEmergencyScreen> {
  final FamilyEmergencyController _controller = FamilyEmergencyController();

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

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;

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
              builder: (context, _) => SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.fromLTRB(20.w, 14.h, 20.w, 28.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileSubHeader(
                      title: s.familyEmergencyTitle,
                      subtitle: s.familyEmergencyPageSubtitle,
                    ),
                    SizedBox(height: 18.h),
                    EmergencyMedicalCard(
                      allergy: _controller.allergy,
                      contactName: _controller.contactName,
                      phone: _controller.phone,
                      onViewFullCard: () => showEmergencyFullCardDialog(context, _controller),
                      onShareTap: () => AppFeedback.showInfo(context, s.comingSoon),
                      onEditTap: _controller.startEditing,
                    ),
                    SizedBox(height: 14.h),
                    EmergencyConsentCard(
                      consentEnabled: _controller.consentEnabled,
                      onChanged: _controller.setConsent,
                    ),
                    SizedBox(height: 14.h),
                    EmergencyQrBanner(
                      secretToken: _controller.secretToken,
                      onEnlargeTap: () => showEmergencyFullCardDialog(context, _controller),
                      onRegenerateTap: () {
                        _controller.regenerateSecretLink();
                        AppFeedback.showSuccess(context, s.linkRegeneratedSuccess);
                      },
                    ),
                    SizedBox(height: 20.h),
                    EmergencyInfoSection(
                      controller: _controller,
                      onSaved: () => AppFeedback.showSuccess(context, s.emergencyUpdatedSuccess),
                    ),
                    SizedBox(height: 20.h),
                    FamilyMembersSection(
                      members: _controller.members,
                      onAddTap: () => showAddFamilyMemberSheet(context, _controller),
                      onEndLink: (i) {
                        _controller.removeFamilyMember(i);
                        AppFeedback.showInfo(context, s.linkEndedSuccess);
                      },
                    ),
                    SizedBox(height: 20.h),
                    MonitoredPeopleSection(
                      people: _controller.monitoredPeople,
                      onAccept: (i) {
                        _controller.acceptMonitoredInvite(i);
                        AppFeedback.showSuccess(context, s.inviteAcceptedSuccess);
                      },
                      onDeclineOrEnd: (i) {
                        final wasPending = _controller.monitoredPeople[i].isPending;
                        _controller.removeMonitoredPerson(i);
                        AppFeedback.showInfo(context, wasPending ? s.inviteDeclinedInfo : s.linkEndedSuccess);
                      },
                      onViewSummary: (i) async {
                        final ended = await Navigator.of(context).push<bool>(
                          MaterialPageRoute(builder: (_) => CaregiverPatientSummaryScreen(patient: _controller.monitoredPeople[i])),
                        );
                        if (ended == true && context.mounted) {
                          _controller.removeMonitoredPerson(i);
                          AppFeedback.showInfo(context, s.linkEndedSuccess);
                        }
                      },
                    ),
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
