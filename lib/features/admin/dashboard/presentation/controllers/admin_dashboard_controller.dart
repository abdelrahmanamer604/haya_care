import 'package:flutter/foundation.dart';

class AdminDashboardController extends ChangeNotifier {
  bool isLoading = false;
  String? errorMessage;

  Future<void> loadOverview() async {
    // TODO: Connect to AdminDashboardRepository
  }
}
