import 'package:flutter/material.dart';
import 'package:haya_care/features/admin/approvals/presentation/screens/admin_approvals_screen.dart';
import 'package:haya_care/features/admin/dashboard/presentation/screens/admin_dashboard_screen.dart';
import 'package:haya_care/features/admin/navigation/presentation/widgets/admin_bottom_nav_bar.dart';
import 'package:haya_care/features/admin/settings/presentation/screens/admin_settings_screen.dart';
import 'package:haya_care/features/admin/users/presentation/screens/admin_users_screen.dart';

class AdminNavigationScreen extends StatefulWidget {
  const AdminNavigationScreen({super.key});

  @override
  State<AdminNavigationScreen> createState() => _AdminNavigationScreenState();
}

class _AdminNavigationScreenState extends State<AdminNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    AdminDashboardScreen(),
    AdminUsersScreen(),
    AdminApprovalsScreen(),
    AdminSettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: AdminBottomNavBar(
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
