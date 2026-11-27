import 'package:haya_care/core/errors/error_handler.dart';
import 'package:haya_care/core/utils/result.dart';
import 'package:haya_care/features/patient/vitals/data/models/vital_reading_model.dart';
import 'package:haya_care/features/patient/vitals/domain/repositories/patient_vitals_repository.dart';

abstract class PatientVitalsRemoteDataSource {
  Future<List<VitalReadingModel>> fetchReadings({
    required VitalCategory category,
    required VitalDateFilter filter,
  });

  Future<VitalReadingModel> addReading(VitalReadingModel reading);
}

class PatientVitalsRemoteDataSourceImpl
    implements PatientVitalsRemoteDataSource {
  @override
  Future<List<VitalReadingModel>> fetchReadings({
    required VitalCategory category,
    required VitalDateFilter filter,
  }) async {
    throw UnimplementedError(
      'Connect PatientVitalsRemoteDataSource.fetchReadings to backend',
    );
  }

  @override
  Future<VitalReadingModel> addReading(VitalReadingModel reading) async {
    throw UnimplementedError(
      'Connect PatientVitalsRemoteDataSource.addReading to backend',
    );
  }
}

class PatientVitalsRepositoryImpl implements PatientVitalsRepository {
  final PatientVitalsRemoteDataSource remoteDataSource;
  const PatientVitalsRepositoryImpl(this.remoteDataSource);

  @override
  Future<Result<List<VitalReadingModel>>> fetchReadings({
    required VitalCategory category,
    required VitalDateFilter filter,
  }) async {
    try {
      final data = await remoteDataSource.fetchReadings(
        category: category,
        filter: filter,
      );
      return Success(data);
    } catch (e) {
      return ErrorResult(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Result<VitalReadingModel>> addReading(
    VitalReadingModel reading,
  ) async {
    try {
      final saved = await remoteDataSource.addReading(reading);
      return Success(saved);
    } catch (e) {
      return ErrorResult(ErrorHandler.handle(e));
    }
  }
}
