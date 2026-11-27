import 'package:haya_care/core/utils/result.dart';

abstract class DoctorAppointmentsRepository {
  Future<Result<List<Map<String, dynamic>>>> fetchAppointments();
  Future<Result<void>> updateAppointmentStatus(String id, String status);
}
