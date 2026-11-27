import 'package:flutter/foundation.dart';

class DoctorAppointmentsController extends ChangeNotifier {
  bool isLoading = false;
  String? errorMessage;

  Future<void> loadAppointments() async {
    // TODO: Connect to DoctorAppointmentsRepository
  }
}
