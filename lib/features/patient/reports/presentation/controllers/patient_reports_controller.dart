import 'package:flutter/foundation.dart';

class PatientReportsController extends ChangeNotifier {
  bool isLoading = false;
  String? errorMessage;

  Future<void> loadReports() async {
    // TODO: Connect to PatientReportsRepository
  }
}
