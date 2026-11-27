import 'package:flutter/foundation.dart';

class DoctorDashboardController extends ChangeNotifier {
  bool isLoading = false;
  String? errorMessage;

  Future<void> loadDashboard() async {
    // TODO: Connect to DoctorDashboardRepository
  }
}
