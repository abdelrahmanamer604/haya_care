import 'package:flutter/foundation.dart';

class AdminSettingsController extends ChangeNotifier {
  bool isLoading = false;
  String? errorMessage;

  Future<void> loadSettings() async {
    // TODO: Connect to AdminSettingsRepository
  }
}
