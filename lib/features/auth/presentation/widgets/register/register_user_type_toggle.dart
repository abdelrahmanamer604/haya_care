import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/widgets/app_segmented_toggle.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class RegisterUserTypeToggle extends StatelessWidget {
  final bool isDoctor;
  final ValueChanged<bool> onTypeChanged;

  const RegisterUserTypeToggle({
    super.key,
    required this.isDoctor,
    required this.onTypeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;

    return AppSegmentedToggle<bool>(
      height: 48.h,
      fontSize: 14.0,
      selectedValue: isDoctor,
      onChanged: onTypeChanged,
      options: [
        AppToggleOption<bool>(
          value: false,
          label: s.patient,
          icon: Icons.person_outline_rounded,
        ),
        AppToggleOption<bool>(
          value: true,
          label: s.doctor,
          icon: Icons.medical_services_outlined,
        ),
      ],
    );
  }
}
