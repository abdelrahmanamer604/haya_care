import 'package:haya_care/core/utils/result.dart';

abstract class AdminSettingsRepository {
  Future<Result<Map<String, dynamic>>> fetchSettings();
  Future<Result<void>> updateSettings(Map<String, dynamic> settings);
}
