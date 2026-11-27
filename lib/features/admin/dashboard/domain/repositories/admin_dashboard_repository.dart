import 'package:haya_care/core/utils/result.dart';

abstract class AdminDashboardRepository {
  Future<Result<Map<String, dynamic>>> fetchOverviewStats();
}
