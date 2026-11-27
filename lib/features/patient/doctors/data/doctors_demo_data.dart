import 'package:haya_care/features/patient/doctors/data/models/doctor_model.dart';
import 'package:haya_care/l10n/app_localizations.dart';

List<DoctorModel> getDemoDoctors(S s) {
  return [
    DoctorModel(
      id: 'doc_samer',
      name: s.docSamerName,
      initials: s.isArabic ? 'سح' : 'SA',
      specialty: s.docSamerSpecialty,
      specialtyTitle: s.docSamerTitle,
      filter: DoctorSpecialtyFilter.familyMedicine,
      yearsExperience: 12,
      rating: 4.9,
      patientsCount: '1.2K',
      availabilityStatus: s.docSamerAvailability,
      bio: s.docSamerBio,
      slots: [
        DoctorAvailabilitySlot(day: s.daySunday, time: s.slot10to4),
        DoctorAvailabilitySlot(day: s.dayTuesday, time: s.slot12to6),
      ],
    ),
    DoctorModel(
      id: 'doc_layan',
      name: s.docLayanName,
      initials: s.isArabic ? 'لق' : 'LQ',
      specialty: s.docLayanSpecialty,
      specialtyTitle: s.docLayanTitle,
      filter: DoctorSpecialtyFilter.diabetes,
      yearsExperience: 9,
      rating: 4.8,
      patientsCount: '950',
      availabilityStatus: s.docLayanAvailability,
      bio: s.docLayanBio,
      slots: [
        DoctorAvailabilitySlot(day: s.dayMonday, time: s.slot9to3),
        DoctorAvailabilitySlot(day: s.dayWednesday, time: s.slot12to6),
      ],
    ),
    DoctorModel(
      id: 'doc_fahad',
      name: s.docFahadName,
      initials: s.isArabic ? 'فع' : 'FO',
      specialty: s.docFahadSpecialty,
      specialtyTitle: s.docFahadTitle,
      filter: DoctorSpecialtyFilter.cardiology,
      yearsExperience: 15,
      rating: 4.7,
      patientsCount: '1.5K',
      availabilityStatus: s.docFahadAvailability,
      bio: s.docFahadBio,
      slots: [
        DoctorAvailabilitySlot(day: s.dayTuesday, time: s.slot10to4),
        DoctorAvailabilitySlot(day: s.dayThursday, time: s.slot9to3),
      ],
    ),
  ];
}

extension _LocaleCheck on S {
  bool get isArabic => localeName.startsWith('ar');
}
