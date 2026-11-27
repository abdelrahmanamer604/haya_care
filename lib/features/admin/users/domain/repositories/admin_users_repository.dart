import 'package:haya_care/core/utils/result.dart';

abstract class AdminUsersRepository {
  Future<Result<List<Map<String, dynamic>>>> fetchUsers();
}
