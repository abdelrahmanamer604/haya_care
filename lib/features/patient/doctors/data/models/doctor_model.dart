enum DoctorSpecialtyFilter {
  all,
  familyMedicine,
  diabetes,
  cardiology,
}

enum DoctorCareStatus { none, pending, active }

class DoctorAvailabilitySlot {
  final String day;
  final String time;

  const DoctorAvailabilitySlot({
    required this.day,
    required this.time,
  });
}

class DoctorModel {
  final String id;
  final String name;
  final String initials;
  final String specialty;
  final String specialtyTitle;
  final DoctorSpecialtyFilter filter;
  final int yearsExperience;
  final double rating;
  final String patientsCount;
  final String availabilityStatus;
  final String bio;
  final List<DoctorAvailabilitySlot> slots;

  const DoctorModel({
    required this.id,
    required this.name,
    required this.initials,
    required this.specialty,
    required this.specialtyTitle,
    required this.filter,
    required this.yearsExperience,
    required this.rating,
    required this.patientsCount,
    required this.availabilityStatus,
    required this.bio,
    required this.slots,
  });
}
