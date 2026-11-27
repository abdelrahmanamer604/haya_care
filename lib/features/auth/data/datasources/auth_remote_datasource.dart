import 'package:haya_care/features/auth/data/models/user_model.dart';
import 'package:haya_care/features/auth/domain/entities/user_entity.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login({
    required String email,
    required String password,
  });

  Future<UserModel> register({
    required String fullName,
    required String email,
    required String password,
    required UserRole role,
    String? specialty,
    String? licenseNumber,
  });

  Future<void> sendPasswordResetEmail(String email);

  Future<void> logout();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    throw UnimplementedError('Connect AuthRemoteDataSource.login to backend');
  }

  @override
  Future<UserModel> register({
    required String fullName,
    required String email,
    required String password,
    required UserRole role,
    String? specialty,
    String? licenseNumber,
  }) async {
    throw UnimplementedError('Connect AuthRemoteDataSource.register to backend');
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    throw UnimplementedError(
      'Connect AuthRemoteDataSource.sendPasswordResetEmail to backend',
    );
  }

  @override
  Future<void> logout() async {
    throw UnimplementedError('Connect AuthRemoteDataSource.logout to backend');
  }
}
