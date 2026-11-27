import 'package:haya_care/core/utils/result.dart';
import 'package:haya_care/features/auth/domain/entities/user_entity.dart';
import 'package:haya_care/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;
  const LoginUseCase(this.repository);

  Future<Result<UserEntity>> call({
    required String email,
    required String password,
  }) =>
      repository.login(email: email, password: password);
}
