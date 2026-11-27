import 'package:flutter/material.dart';
import 'package:haya_care/features/doctor/appointments/presentation/screens/doctor_appointments_screen.dart';
import 'package:haya_care/features/doctor/dashboard/presentation/screens/doctor_dashboard_screen.dart';
import 'package:haya_care/features/doctor/navigation/presentation/widgets/doctor_bottom_nav_bar.dart';
import 'package:haya_care/features/doctor/patients/presentation/screens/doctor_patients_screen.dart';
import 'package:haya_care/features/doctor/profile/presentation/screens/doctor_profile_screen.dart';

class DoctorNavigationScreen extends StatefulWidget {
  const DoctorNavigationScreen({super.key});

  @override
  State<DoctorNavigationScreen> createState() => _DoctorNavigationScreenState();
}

class _DoctorNavigationScreenState extends State<DoctorNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    DoctorDashboardScreen(),
    DoctorPatientsScreen(),
    DoctorAppointmentsScreen(),
    DoctorProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: DoctorBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
