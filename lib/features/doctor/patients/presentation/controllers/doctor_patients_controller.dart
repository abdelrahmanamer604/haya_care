import 'package:flutter/foundation.dart';

class DoctorPatientsController extends ChangeNotifier {
  bool isLoading = false;
  String? errorMessage;

  Future<void> loadPatients() async {
    // TODO: Connect to DoctorPatientsRepository
  }
}
