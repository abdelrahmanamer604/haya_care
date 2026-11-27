import 'package:flutter/foundation.dart';

enum AnalyticsPeriod {
  daily,
  weekly,
  monthly,
}

class PatientAnalyticsController extends ChangeNotifier {
  AnalyticsPeriod _selectedPeriod = AnalyticsPeriod.weekly;

  AnalyticsPeriod get selectedPeriod => _selectedPeriod;

  void selectPeriod(AnalyticsPeriod period) {
    if (_selectedPeriod == period) return;
    _selectedPeriod = period;
    notifyListeners();
  }

  Future<void> loadAnalytics() async {
    // TODO: Connect to PatientVitalsRepository
  }
}
