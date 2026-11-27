import 'package:flutter/foundation.dart';

class DoctorProfileController extends ChangeNotifier {
  bool isLoading = false;
  String? errorMessage;

  Future<void> loadProfile() async {
    // TODO: Connect to DoctorProfileRepository
  }
}
