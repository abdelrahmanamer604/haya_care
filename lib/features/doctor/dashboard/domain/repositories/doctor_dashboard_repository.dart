import 'package:haya_care/core/utils/result.dart';

abstract class DoctorDashboardRepository {
  Future<Result<Map<String, dynamic>>> fetchDashboardSummary();
}
