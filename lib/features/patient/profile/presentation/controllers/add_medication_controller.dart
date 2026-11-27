import 'package:flutter/material.dart';
import 'package:haya_care/l10n/app_localizations.dart';

enum MealTimingOption {
  beforeBreakfast,
  afterBreakfast,
  beforeLunch,
  afterLunch,
  beforeDinner,
  afterDinner,
}

class AddMedicationController extends ChangeNotifier {
  TimeOfDay? selectedTime;
  MealTimingOption? selectedMeal;
  bool reminderEnabled = true;

  void setTime(TimeOfDay time) {
    selectedTime = time;
    notifyListeners();
  }

  void toggleMeal(MealTimingOption option) {
    selectedMeal = selectedMeal == option ? null : option;
    notifyListeners();
  }

  void setReminder(bool value) {
    reminderEnabled = value;
    notifyListeners();
  }

  bool validate(String name, String dosage) =>
      name.trim().isNotEmpty && dosage.trim().isNotEmpty;

  Map<MealTimingOption, String> mealLabels(S s) => {
        MealTimingOption.beforeBreakfast: s.beforeBreakfast,
        MealTimingOption.afterBreakfast: s.afterBreakfast,
        MealTimingOption.beforeLunch: s.beforeLunch,
        MealTimingOption.afterLunch: s.afterLunch,
        MealTimingOption.beforeDinner: s.beforeDinner,
        MealTimingOption.afterDinner: s.afterDinner,
      };

  String buildSchedule({
    required S s,
    required String frequency,
    String? formattedTime,
  }) {
    final parts = <String>[
      if (formattedTime != null && formattedTime.isNotEmpty) formattedTime,
      if (selectedMeal != null) mealLabels(s)[selectedMeal]!,
      frequency,
    ];
    return parts.join(' · ');
  }
}
