import 'package:flutter/material.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/core/widgets/feature_placeholder_view.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class DoctorAppointmentsScreen extends StatelessWidget {
  const DoctorAppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FeaturePlaceholderView(
      title: S.of(context)!.doctorAppointmentsNav,
      icon: Icons.calendar_today_outlined,
      accentColor: AppColors.successGreen,
      accentBgColor: context.appColors.greenSurface,
    );
  }
}
