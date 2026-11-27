import 'package:flutter/foundation.dart';
import 'package:haya_care/features/patient/profile/data/models/monitored_patient_model.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class FamilyMemberModel {
  final String initials, name, subtitle;
  final bool isPending;

  const FamilyMemberModel({
    required this.initials,
    required this.name,
    required this.subtitle,
    this.isPending = false,
  });
}

class FamilyEmergencyController extends ChangeNotifier {
  bool consentEnabled = false;
  bool isEditingInfo = false;
  String secretToken = 'HC-9482';
  String contactName = '';
  String relationship = '';
  String phone = '';
  String allergy = '';
  final List<FamilyMemberModel> members = [];
  final List<MonitoredPatientModel> monitoredPeople = [];
  bool _initialized = false;

  void initIfNeeded(S s) {
    if (_initialized) return;
    contactName = s.emergencyContactName;
    relationship = s.emergencyContactRelation;
    phone = s.emergencyContactPhone;
    allergy = s.allergyShortValue;
    members.add(FamilyMemberModel(initials: s.emergencyMemberInitials, name: s.emergencyContactName, subtitle: s.primaryContactSubtitle));
    monitoredPeople.addAll(getMonitoredPatientsDemo(s));
    _initialized = true;
  }

  void setConsent(bool value) {
    consentEnabled = value;
    notifyListeners();
  }

  void regenerateSecretLink() {
    final code = (1000 + DateTime.now().millisecond * 9) % 9000 + 1000;
    secretToken = 'HC-$code';
    notifyListeners();
  }

  void startEditing() {
    isEditingInfo = true;
    notifyListeners();
  }

  void cancelEditing() {
    isEditingInfo = false;
    notifyListeners();
  }

  void saveEmergencyInfo({required String name, required String relation, required String phoneNumber, required String allergyText}) {
    if (name.trim().isNotEmpty) contactName = name.trim();
    if (relation.trim().isNotEmpty) relationship = relation.trim();
    if (phoneNumber.trim().isNotEmpty) phone = phoneNumber.trim();
    if (allergyText.trim().isNotEmpty) allergy = allergyText.trim();
    isEditingInfo = false;
    notifyListeners();
  }

  void addFamilyMember({required String name, required String relation, required String email, required S s}) {
    final trimmed = name.trim();
    final parts = trimmed.split(RegExp(r'\s+')).where((p) => p.isNotEmpty).toList();
    final initials = parts.length >= 2 ? '${parts[0][0]}${parts[1][0]}' : (trimmed.length >= 2 ? trimmed.substring(0, 2) : trimmed);
    members.add(FamilyMemberModel(
      initials: initials.toUpperCase(),
      name: trimmed,
      subtitle: '${relation.trim()} · ${email.trim()}',
      isPending: true,
    ));
    notifyListeners();
  }

  void removeFamilyMember(int index) {
    if (index < 0 || index >= members.length) return;
    members.removeAt(index);
    notifyListeners();
  }

  void acceptMonitoredInvite(int index) {
    if (index < 0 || index >= monitoredPeople.length) return;
    monitoredPeople[index] = monitoredPeople[index].copyWith(isPending: false);
    notifyListeners();
  }

  void removeMonitoredPerson(int index) {
    if (index < 0 || index >= monitoredPeople.length) return;
    monitoredPeople.removeAt(index);
    notifyListeners();
  }
}
