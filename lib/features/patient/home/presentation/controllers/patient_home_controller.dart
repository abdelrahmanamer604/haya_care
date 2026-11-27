import 'package:flutter/foundation.dart';

class PatientHomeController extends ChangeNotifier {
  bool isLoading = false;
  String? errorMessage;

  Future<void> loadHomeData() async {
    // TODO: Connect to PatientHomeRepository
  }
}
