import 'package:haya_care/features/patient/vitals/data/models/vital_reading_model.dart';
import 'package:haya_care/l10n/app_localizations.dart';

VitalReadingModel _r(String id, VitalCategory cat, String val, String unit, String time, String note, VitalStatus status, int daysAgo) =>
    VitalReadingModel(id: id, category: cat, value: val, unit: unit, timeLabel: time, note: note, status: status, daysAgo: daysAgo);

List<String> getVitalContextOptions(S s, VitalCategory category) => switch (category) {
      VitalCategory.bloodPressure => const [],
      VitalCategory.bloodSugar => [s.fasting, s.beforeBreakfast, s.afterLunch, s.beforeSleep],
      VitalCategory.weight => [s.morningNote, s.eveningNote],
      VitalCategory.heartRate || VitalCategory.oxygen || VitalCategory.temperature => [s.restingTime, s.afterWalking, s.afterExercise],
    };

(String? value, String note, String? error) resolveVitalReadingInput({
  required S s,
  required VitalCategory category,
  required String systolic,
  required String diastolic,
  required String pulse,
  required String singleValue,
  required String rawNote,
  required int contextIndex,
}) {
  var note = rawNote.trim();
  if (category == VitalCategory.bloodPressure) {
    if (systolic.trim().isEmpty || diastolic.trim().isEmpty) return (null, note, s.fieldRequired);
    final sys = double.tryParse(systolic.trim());
    final dia = double.tryParse(diastolic.trim());
    if (sys == null || dia == null || sys < 60 || sys > 250 || dia < 40 || dia > 150) {
      return (null, note, s.invalidRangeError);
    }
    if (note.isEmpty && pulse.trim().isNotEmpty) note = '${s.pulseLabel} ${pulse.trim()}';
    return ('${systolic.trim()}/${diastolic.trim()}', note, null);
  }
  if (singleValue.trim().isEmpty) return (null, note, s.fieldRequired);
  final val = double.tryParse(singleValue.trim());
  final (min, max) = switch (category) {
    VitalCategory.bloodSugar => (20.0, 600.0),
    VitalCategory.weight => (20.0, 300.0),
    VitalCategory.heartRate => (30.0, 220.0),
    VitalCategory.oxygen => (50.0, 100.0),
    VitalCategory.temperature => (30.0, 45.0),
    VitalCategory.bloodPressure => (0.0, 300.0),
  };
  if (val == null || val < min || val > max) return (null, note, s.invalidRangeError);
  final options = getVitalContextOptions(s, category);
  if (note.isEmpty && options.isNotEmpty) note = options[contextIndex.clamp(0, options.length - 1)];
  return (singleValue.trim(), note, null);
}

List<VitalReadingModel> getVitalsDemoReadings(S s, VitalCategory category) => switch (category) {
      VitalCategory.bloodPressure => [
          _r('bp_1', category, '128/82', s.bloodPressureUnit, s.todayTime830, s.pulseNote72, VitalStatus.normal, 0),
          _r('bp_2', category, '136/88', s.bloodPressureUnit, s.yesterdayTime915, s.pulseNote76, VitalStatus.followUp, 1),
          _r('bp_3', category, '124/80', s.bloodPressureUnit, s.may14Time745, s.pulseNote70, VitalStatus.normal, 4),
          _r('bp_4', category, '122/78', s.bloodPressureUnit, s.may5Time715, s.pulseNote72, VitalStatus.normal, 18),
        ],
      VitalCategory.bloodSugar => [
          _r('bs_1', category, '104', s.bloodSugarUnit, s.todayTime730, s.beforeBreakfast, VitalStatus.normal, 0),
          _r('bs_2', category, '142', s.bloodSugarUnit, s.yesterdayTime320, s.afterLunch, VitalStatus.followUp, 1),
          _r('bs_3', category, '98', s.bloodSugarUnit, s.may14Time800, s.fasting, VitalStatus.normal, 5),
          _r('bs_4', category, '110', s.bloodSugarUnit, s.may5Time715, s.fasting, VitalStatus.normal, 20),
        ],
      VitalCategory.weight => [
          _r('w_1', category, '82.4', s.weightUnit, s.todayTime720, s.morningNote, VitalStatus.stable, 0),
          _r('w_2', category, '82.8', s.weightUnit, s.may12Time730, s.morningNote, VitalStatus.stable, 3),
          _r('w_3', category, '83.1', s.weightUnit, s.may5Time715, s.morningNote, VitalStatus.followUp, 6),
        ],
      VitalCategory.heartRate => [
          _r('hr_1', category, '72', s.heartRateUnit, s.todayTime835, s.restingTime, VitalStatus.normal, 0),
          _r('hr_2', category, '78', s.heartRateUnit, s.yesterdayTime610, s.afterWalking, VitalStatus.normal, 1),
          _r('hr_3', category, '69', s.heartRateUnit, s.may14Time900, s.restingTime, VitalStatus.normal, 4),
        ],
      VitalCategory.oxygen => [
          _r('ox_1', category, '98', s.oxygenUnit, s.todayTime830, s.restingTime, VitalStatus.normal, 0),
          _r('ox_2', category, '97', s.oxygenUnit, s.yesterdayTime610, s.afterWalking, VitalStatus.normal, 1),
        ],
      VitalCategory.temperature => [
          _r('tp_1', category, '36.8', s.temperatureUnit, s.todayTime730, s.restingTime, VitalStatus.normal, 0),
          _r('tp_2', category, '37.1', s.temperatureUnit, s.yesterdayTime915, s.restingTime, VitalStatus.stable, 1),
        ],
    };
