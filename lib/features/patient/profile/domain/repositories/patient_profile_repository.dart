import 'package:haya_care/core/utils/result.dart';

abstract class PatientProfileRepository {
  Future<Result<Map<String, dynamic>>> fetchProfile();
  Future<Result<void>> updateProfile(Map<String, dynamic> payload);
}
