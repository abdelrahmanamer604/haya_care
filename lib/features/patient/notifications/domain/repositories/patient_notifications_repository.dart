import 'package:haya_care/core/utils/result.dart';

abstract class PatientNotificationsRepository {
  Future<Result<List<Map<String, dynamic>>>> fetchNotifications();
  Future<Result<void>> markAllRead();
}
