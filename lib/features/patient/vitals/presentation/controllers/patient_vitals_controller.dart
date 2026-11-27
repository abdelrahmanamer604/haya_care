import 'package:flutter/foundation.dart';
import 'package:haya_care/features/patient/vitals/data/models/vital_reading_model.dart';
import 'package:haya_care/features/patient/vitals/data/vitals_demo_data.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class PatientVitalsController extends ChangeNotifier {
  VitalCategory _selectedCategory = VitalCategory.bloodPressure;
  VitalDateFilter _selectedFilter = VitalDateFilter.last7Days;
  final Map<VitalCategory, List<VitalReadingModel>> _addedReadings = {};
  final Map<String, VitalReadingModel> _editedReadings = {};
  final Set<String> _deletedIds = {};
  bool isLoading = false;
  String? errorMessage;

  VitalCategory get selectedCategory => _selectedCategory;
  VitalDateFilter get selectedFilter => _selectedFilter;

  void selectCategory(VitalCategory category) {
    if (_selectedCategory == category) return;
    _selectedCategory = category;
    notifyListeners();
  }

  void selectFilter(VitalDateFilter filter) {
    if (_selectedFilter == filter) return;
    _selectedFilter = filter;
    notifyListeners();
  }

  void addReading({required S s, required String value, required String note}) {
    final list = _addedReadings.putIfAbsent(_selectedCategory, () => []);
    list.insert(
      0,
      VitalReadingModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        category: _selectedCategory,
        value: value,
        unit: _unitForCategory(s, _selectedCategory),
        timeLabel: s.justNow,
        note: note,
        status: VitalStatus.normal,
        daysAgo: 0,
      ),
    );
    notifyListeners();
  }

  void updateReading({
    required VitalReadingModel original,
    required String value,
    required String note,
  }) {
    _editedReadings[original.id] = VitalReadingModel(
      id: original.id,
      category: original.category,
      value: value,
      unit: original.unit,
      timeLabel: original.timeLabel,
      note: note,
      status: original.status,
      daysAgo: original.daysAgo,
    );
    notifyListeners();
  }

  void deleteReading(String id) {
    _deletedIds.add(id);
    _editedReadings.remove(id);
    _addedReadings[_selectedCategory]?.removeWhere((r) => r.id == id);
    notifyListeners();
  }

  List<VitalReadingModel> filteredReadings(S s) {
    final allForCategory = [
      ...?_addedReadings[_selectedCategory],
      ...getVitalsDemoReadings(s, _selectedCategory),
    ]
        .where((r) => !_deletedIds.contains(r.id))
        .map((r) => _editedReadings[r.id] ?? r)
        .toList();

    return switch (_selectedFilter) {
      VitalDateFilter.last7Days => allForCategory.where((r) => r.daysAgo <= 7).toList(),
      VitalDateFilter.last30Days => allForCategory.where((r) => r.daysAgo <= 30).toList(),
      VitalDateFilter.all => allForCategory,
    };
  }

  String _unitForCategory(S s, VitalCategory category) => switch (category) {
        VitalCategory.bloodPressure => s.bloodPressureUnit,
        VitalCategory.bloodSugar => s.bloodSugarUnit,
        VitalCategory.weight => s.weightUnit,
        VitalCategory.heartRate => s.heartRateUnit,
        VitalCategory.oxygen => s.oxygenUnit,
        VitalCategory.temperature => s.temperatureUnit,
      };

  Future<void> loadReadings() async {
    // TODO: Connect to PatientVitalsRepository
  }
}
