import 'package:flutter/material.dart';
import 'package:haya_care/core/widgets/feature_placeholder_view.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class DoctorProfileScreen extends StatelessWidget {
  const DoctorProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FeaturePlaceholderView(
      title: S.of(context)!.doctorProfileNav,
      icon: Icons.person_outline_rounded,
    );
  }
}
