import 'package:haya_care/l10n/app_localizations.dart';

class MonitoredVitalSummary {
  final String label;
  final String value;
  final String unit;
  final bool isWatch;

  const MonitoredVitalSummary({
    required this.label,
    required this.value,
    required this.unit,
    this.isWatch = false,
  });
}

class MonitoredPatientModel {
  final String id;
  final String initials;
  final String name;
  final String relation;
  final bool isPending;
  final List<MonitoredVitalSummary> vitals;
  final List<String> urgentAlerts;

  const MonitoredPatientModel({
    required this.id,
    required this.initials,
    required this.name,
    required this.relation,
    this.isPending = false,
    this.vitals = const [],
    this.urgentAlerts = const [],
  });

  MonitoredPatientModel copyWith({bool? isPending}) => MonitoredPatientModel(
        id: id,
        initials: initials,
        name: name,
        relation: relation,
        isPending: isPending ?? this.isPending,
        vitals: vitals,
        urgentAlerts: urgentAlerts,
      );
}

List<MonitoredPatientModel> getMonitoredPatientsDemo(S s) => [
      MonitoredPatientModel(
        id: 'p1',
        initials: 'AH',
        name: s.parentMonitorName,
        relation: s.readOnlyBadge,
        isPending: false,
        vitals: [
          MonitoredVitalSummary(label: s.bloodPressure, value: '138/88', unit: s.bloodPressureUnit, isWatch: true),
          MonitoredVitalSummary(label: s.bloodSugar, value: '112', unit: s.bloodSugarUnit),
          MonitoredVitalSummary(label: s.heartRate, value: '76', unit: s.heartRateUnit),
          MonitoredVitalSummary(label: s.oxygenLabel, value: '98', unit: s.oxygenUnit),
        ],
        urgentAlerts: [s.urgentAlertSampleMsg],
      ),
      MonitoredPatientModel(
        id: 'p2',
        initials: 'FA',
        name: s.motherInviteName,
        relation: s.incomingInviteBadge,
        isPending: true,
        vitals: [
          MonitoredVitalSummary(label: s.bloodPressure, value: '122/78', unit: s.bloodPressureUnit),
          MonitoredVitalSummary(label: s.bloodSugar, value: '104', unit: s.bloodSugarUnit),
        ],
      ),
    ];
