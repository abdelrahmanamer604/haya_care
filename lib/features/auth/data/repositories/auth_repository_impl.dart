import 'package:haya_care/core/errors/error_handler.dart';
import 'package:haya_care/core/utils/result.dart';
import 'package:haya_care/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:haya_care/features/auth/domain/entities/user_entity.dart';
import 'package:haya_care/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  const AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Result<UserEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final user = await remoteDataSource.login(
        email: email,
        password: password,
      );
      return Success(user);
    } catch (e) {
      return ErrorResult(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Result<UserEntity>> register({
    required String fullName,
    required String email,
    required String password,
    required UserRole role,
    String? specialty,
    String? licenseNumber,
  }) async {
    try {
      final user = await remoteDataSource.register(
        fullName: fullName,
        email: email,
        password: password,
        role: role,
        specialty: specialty,
        licenseNumber: licenseNumber,
      );
      return Success(user);
    } catch (e) {
      return ErrorResult(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Result<void>> sendPasswordResetEmail(String email) async {
    try {
      await remoteDataSource.sendPasswordResetEmail(email);
      return const Success(null);
    } catch (e) {
      return ErrorResult(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Result<void>> logout() async {
    try {
      await remoteDataSource.logout();
      return const Success(null);
    } catch (e) {
      return ErrorResult(ErrorHandler.handle(e));
    }
  }
}
