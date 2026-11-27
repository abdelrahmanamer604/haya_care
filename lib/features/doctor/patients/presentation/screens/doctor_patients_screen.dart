import 'package:flutter/material.dart';
import 'package:haya_care/core/widgets/feature_placeholder_view.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class DoctorPatientsScreen extends StatelessWidget {
  const DoctorPatientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FeaturePlaceholderView(
      title: S.of(context)!.doctorPatientsNav,
      icon: Icons.people_outline_rounded,
    );
  }
}
