import 'package:haya_care/core/utils/result.dart';
import 'package:haya_care/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Result<UserEntity>> login({
    required String email,
    required String password,
  });

  Future<Result<UserEntity>> register({
    required String fullName,
    required String email,
    required String password,
    required UserRole role,
    String? specialty,
    String? licenseNumber,
  });

  Future<Result<void>> sendPasswordResetEmail(String email);

  Future<Result<void>> logout();
}
