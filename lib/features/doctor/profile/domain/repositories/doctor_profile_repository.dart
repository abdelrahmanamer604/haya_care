import 'package:haya_care/core/utils/result.dart';

abstract class DoctorProfileRepository {
  Future<Result<Map<String, dynamic>>> fetchProfile();
}
