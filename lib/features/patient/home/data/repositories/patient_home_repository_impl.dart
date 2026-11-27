import 'package:haya_care/core/errors/error_handler.dart';
import 'package:haya_care/core/utils/result.dart';
import 'package:haya_care/features/patient/home/domain/repositories/patient_home_repository.dart';

abstract class PatientHomeRemoteDataSource {
  Future<Map<String, dynamic>> fetchHomeSummary();
}

class PatientHomeRemoteDataSourceImpl implements PatientHomeRemoteDataSource {
  @override
  Future<Map<String, dynamic>> fetchHomeSummary() async {
    throw UnimplementedError('Connect PatientHomeRemoteDataSource to backend');
  }
}

class PatientHomeRepositoryImpl implements PatientHomeRepository {
  final PatientHomeRemoteDataSource remoteDataSource;
  const PatientHomeRepositoryImpl(this.remoteDataSource);

  @override
  Future<Result<Map<String, dynamic>>> fetchHomeSummary() async {
    try {
      final data = await remoteDataSource.fetchHomeSummary();
      return Success(data);
    } catch (e) {
      return ErrorResult(ErrorHandler.handle(e));
    }
  }
}
