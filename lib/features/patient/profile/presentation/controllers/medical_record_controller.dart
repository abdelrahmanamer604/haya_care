import 'package:flutter/foundation.dart';
import 'package:haya_care/l10n/app_localizations.dart';

enum MedicalRecordCategory { conditions, allergies, medications }

class MedicalRecordController extends ChangeNotifier {
  final List<String> conditions = [];
  final List<String> allergies = [];
  final List<String> medications = [];
  bool _initialized = false;

  void initIfNeeded(S s) {
    if (_initialized) return;
    conditions.addAll([s.conditionHypertension, s.conditionType2Diabetes]);
    allergies.add(s.allergyPenicillin);
    medications.addAll([s.medMetformin500, s.medAmlodipine5]);
    _initialized = true;
  }

  List<String> itemsFor(MedicalRecordCategory category) {
    switch (category) {
      case MedicalRecordCategory.conditions:
        return conditions;
      case MedicalRecordCategory.allergies:
        return allergies;
      case MedicalRecordCategory.medications:
        return medications;
    }
  }

  void addItem(MedicalRecordCategory category, String rawValue) {
    final value = rawValue.trim();
    if (value.isEmpty) return;
    itemsFor(category).add(value);
    notifyListeners();
  }

  void removeItem(MedicalRecordCategory category, int index) {
    final list = itemsFor(category);
    if (index < 0 || index >= list.length) return;
    list.removeAt(index);
    notifyListeners();
  }
}
