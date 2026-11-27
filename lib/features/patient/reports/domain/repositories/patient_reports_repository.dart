import 'package:haya_care/core/utils/result.dart';

abstract class PatientReportsRepository {
  Future<Result<List<Map<String, dynamic>>>> fetchReports();
}
