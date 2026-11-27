import 'package:flutter/foundation.dart';
import 'package:haya_care/features/patient/profile/data/medical_report_pdf_service.dart';
import 'package:haya_care/features/patient/profile/data/profile_demo_data.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class PatientMedicationsController extends ChangeNotifier {
  final List<MedicationDoseModel> doses = [];
  final Map<String, bool> _takenOverrides = {};
  bool _initialized = false;

  void initIfNeeded(S s) {
    if (_initialized) return;
    doses.addAll(getDemoMedicationDoses(s));
    _initialized = true;
  }

  bool isTaken(MedicationDoseModel dose) =>
      _takenOverrides[dose.id] ?? dose.initialTaken;

  void toggleDose(MedicationDoseModel dose) {
    _takenOverrides[dose.id] = !isTaken(dose);
    notifyListeners();
  }

  void addMedication({
    required String name,
    required String dosage,
    required String frequency,
    required String schedule,
  }) {
    final id = 'med_${DateTime.now().millisecondsSinceEpoch}';
    doses.insert(
      0,
      MedicationDoseModel(
        id: id,
        name: name.trim(),
        dosage: '$dosage · $frequency',
        schedule: schedule,
        initialTaken: false,
      ),
    );
    notifyListeners();
  }

  void updateMedication({
    required String id,
    required String name,
    required String dosage,
    required String frequency,
    required String schedule,
  }) {
    final index = doses.indexWhere((d) => d.id == id);
    if (index == -1) return;
    doses[index] = MedicationDoseModel(
      id: id,
      name: name.trim(),
      dosage: '$dosage · $frequency',
      schedule: schedule,
      initialTaken: doses[index].initialTaken,
    );
    notifyListeners();
  }

  void deleteMedication(String id) {
    doses.removeWhere((d) => d.id == id);
    _takenOverrides.remove(id);
    notifyListeners();
  }
}

class PatientReportsController extends ChangeNotifier {
  int selectedPeriod = 1;
  bool isExporting = false;

  void selectPeriod(int period) {
    if (selectedPeriod == period) return;
    selectedPeriod = period;
    notifyListeners();
  }

  Future<bool> exportPdf(ReportPeriodSummary summary, S s) async {
    isExporting = true;
    notifyListeners();
    try {
      await MedicalReportPdfService.exportReport(summary, s);
      return true;
    } catch (e, st) {
      debugPrint('PDF Export Error: $e\n$st');
      return false;
    } finally {
      isExporting = false;
      notifyListeners();
    }
  }
}

class PatientMessagesController extends ChangeNotifier {
  String searchQuery = '';

  void setSearchQuery(String query) {
    searchQuery = query;
    notifyListeners();
  }

  void clearSearch() {
    searchQuery = '';
    notifyListeners();
  }

  List<MessageThreadModel> filterThreads(List<MessageThreadModel> all) {
    final q = searchQuery.trim().toLowerCase();
    if (q.isEmpty) return all;
    return all
        .where((t) =>
            t.name.toLowerCase().contains(q) ||
            t.lastMessage.toLowerCase().contains(q))
        .toList();
  }
}

class PatientHealthTipsController extends ChangeNotifier {
  int selectedFilter = 0;

  void selectFilter(int filter) {
    if (selectedFilter == filter) return;
    selectedFilter = filter;
    notifyListeners();
  }

  List<HealthTipModel> filterTips(List<HealthTipModel> all) {
    if (selectedFilter == 0) return all;
    return all.where((t) => t.categoryId == selectedFilter).toList();
  }
}
