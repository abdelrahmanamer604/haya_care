import 'package:flutter/foundation.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class PatientProfileController extends ChangeNotifier {
  String userName = '';
  String userEmail = '';
  String userInitials = '';
  bool isEditingPersonalInfo = false;
  bool remindersEnabled = true;
  bool shareHealthData = false;
  bool assistantAccess = false;
  bool isLoading = false;
  String? errorMessage;
  bool _initialized = false;

  void initIfNeeded(S s) {
    if (_initialized) return;
    userName = s.profileDemoName;
    userEmail = s.profileDemoEmail;
    userInitials = s.profileDemoInitials;
    _initialized = true;
  }

  void startEditingPersonalInfo() {
    isEditingPersonalInfo = true;
    notifyListeners();
  }

  void cancelEditingPersonalInfo() {
    isEditingPersonalInfo = false;
    notifyListeners();
  }

  void savePersonalInfo(String name, String email) {
    final trimmedName = name.trim();
    final trimmedEmail = email.trim();
    if (trimmedName.isNotEmpty) {
      userName = trimmedName;
      final parts =
          trimmedName.split(RegExp(r'\s+')).where((p) => p.isNotEmpty).toList();
      userInitials = parts.length >= 2
          ? '${parts[0][0]}${parts[1][0]}'.toUpperCase()
          : (trimmedName.length >= 2
              ? trimmedName.substring(0, 2).toUpperCase()
              : trimmedName.toUpperCase());
    }
    if (trimmedEmail.isNotEmpty) userEmail = trimmedEmail;
    isEditingPersonalInfo = false;
    notifyListeners();
  }

  void setReminders(bool value) {
    remindersEnabled = value;
    notifyListeners();
  }

  void setShareHealthData(bool value) {
    shareHealthData = value;
    notifyListeners();
  }

  void setAssistantAccess(bool value) {
    assistantAccess = value;
    notifyListeners();
  }

  Future<void> loadProfile() async {
    // TODO: Connect to PatientProfileRepository
  }
}
