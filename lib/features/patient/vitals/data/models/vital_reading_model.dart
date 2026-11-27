enum VitalCategory {
  bloodPressure,
  bloodSugar,
  weight,
  heartRate,
  oxygen,
  temperature,
}

enum VitalStatus {
  normal,
  stable,
  followUp,
}

enum VitalDateFilter {
  last7Days,
  last30Days,
  all,
}

class VitalReadingModel {
  final String id;
  final VitalCategory category;
  final String value;
  final String unit;
  final String timeLabel;
  final String note;
  final VitalStatus status;
  final int daysAgo;

  const VitalReadingModel({
    required this.id,
    required this.category,
    required this.value,
    required this.unit,
    required this.timeLabel,
    required this.note,
    required this.status,
    required this.daysAgo,
  });
}
