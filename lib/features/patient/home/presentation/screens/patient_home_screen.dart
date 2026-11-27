import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/routing/routes.dart';
import 'package:haya_care/core/utils/responsive.dart';
import 'package:haya_care/core/widgets/sticky_pull_header_scroll_view.dart';
import 'package:haya_care/features/patient/doctors/data/doctors_demo_data.dart';
import 'package:haya_care/features/patient/home/presentation/widgets/home_header.dart';
import 'package:haya_care/features/patient/home/presentation/widgets/home_health_chart_card.dart';
import 'package:haya_care/features/patient/home/presentation/widgets/home_next_appointment_card.dart';
import 'package:haya_care/features/patient/home/presentation/widgets/home_sos_card.dart';
import 'package:haya_care/features/patient/home/presentation/widgets/home_vitals_section.dart';
import 'package:haya_care/features/patient/home/presentation/widgets/home_welcome_banner.dart';
import 'package:haya_care/features/patient/vitals/data/models/vital_reading_model.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class PatientHomeScreen extends StatelessWidget {
  final ValueChanged<VitalCategory?>? onOpenVitals;
  final VoidCallback? onOpenProfile;

  const PatientHomeScreen({super.key, this.onOpenVitals, this.onOpenProfile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        bottom: false,
        child: AdaptiveScaffoldWrapper(
          maxContentWidth: 440,
          child: StickyPullHeaderScrollView(
            headerHeight: 54,
            header: HomeHeader(
              onMessagesTap: () => Navigator.of(context).pushNamed(Routes.patientMessages),
              onNotificationTap: () => Navigator.of(context).pushNamed(Routes.patientNotifications),
              onProfileTap: onOpenProfile,
            ),
            children: [
              SizedBox(height: 12.h),
              const HomeWelcomeBanner(),
              SizedBox(height: 14.h),
              const HomeSosCard(),
              SizedBox(height: 20.h),
              HomeVitalsSection(onCategoryTap: (c) => onOpenVitals?.call(c)),
              SizedBox(height: 16.h),
              HomeHealthChartCard(
                onDetailsTap: () => Navigator.of(context).pushNamed(Routes.patientAnalytics),
              ),
              SizedBox(height: 22.h),
              HomeNextAppointmentCard(
                onTap: () => Navigator.of(context).pushNamed(
                  Routes.doctorProfile,
                  arguments: getDemoDoctors(S.of(context)!).first,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
