import 'package:flutter/material.dart';
import 'package:haya_care/features/patient/doctors/data/models/doctor_model.dart';

class PatientDoctorsController extends ChangeNotifier {
  DoctorSpecialtyFilter _selectedFilter = DoctorSpecialtyFilter.all;
  String _searchQuery = '';

  DoctorSpecialtyFilter get selectedFilter => _selectedFilter;
  String get searchQuery => _searchQuery;

  void selectFilter(DoctorSpecialtyFilter filter) {
    if (_selectedFilter == filter) return;
    _selectedFilter = filter;
    notifyListeners();
  }

  void setSearchQuery(String query) {
    final normalized = query.trim();
    if (_searchQuery == normalized) return;
    _searchQuery = normalized;
    notifyListeners();
  }

  List<DoctorModel> filterDoctors(List<DoctorModel> allDoctors) {
    final query = _searchQuery.toLowerCase();
    return allDoctors.where((doctor) {
      final matchesFilter = _selectedFilter == DoctorSpecialtyFilter.all ||
          doctor.filter == _selectedFilter;
      if (!matchesFilter) return false;
      if (query.isEmpty) return true;
      return doctor.name.toLowerCase().contains(query) ||
          doctor.specialty.toLowerCase().contains(query) ||
          doctor.specialtyTitle.toLowerCase().contains(query);
    }).toList();
  }
}
