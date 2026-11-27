import 'package:haya_care/core/utils/result.dart';

abstract class PatientHomeRepository {
  Future<Result<Map<String, dynamic>>> fetchHomeSummary();
}
