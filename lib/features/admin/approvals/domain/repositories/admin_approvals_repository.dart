import 'package:haya_care/core/utils/result.dart';

abstract class AdminApprovalsRepository {
  Future<Result<List<Map<String, dynamic>>>> fetchPendingDoctors();
  Future<Result<void>> reviewDoctor(String doctorId, {required bool approved});
}
