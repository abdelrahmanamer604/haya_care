import 'package:haya_care/core/utils/result.dart';

abstract class DoctorPatientsRepository {
  Future<Result<List<Map<String, dynamic>>>> fetchPatients();
}
