import 'package:haya_care/core/utils/result.dart';
import 'package:haya_care/features/patient/vitals/data/models/vital_reading_model.dart';

abstract class PatientVitalsRepository {
  Future<Result<List<VitalReadingModel>>> fetchReadings({
    required VitalCategory category,
    required VitalDateFilter filter,
  });

  Future<Result<VitalReadingModel>> addReading(VitalReadingModel reading);
}
