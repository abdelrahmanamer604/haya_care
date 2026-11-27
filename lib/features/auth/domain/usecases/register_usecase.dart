import 'package:haya_care/core/utils/result.dart';
import 'package:haya_care/features/auth/domain/entities/user_entity.dart';
import 'package:haya_care/features/auth/domain/repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository repository;
  const RegisterUseCase(this.repository);

  Future<Result<UserEntity>> call({
    required String fullName,
    required String email,
    required String password,
    required UserRole role,
    String? specialty,
    String? licenseNumber,
  }) =>
      repository.register(
        fullName: fullName,
        email: email,
        password: password,
        role: role,
        specialty: specialty,
        licenseNumber: licenseNumber,
      );
}
