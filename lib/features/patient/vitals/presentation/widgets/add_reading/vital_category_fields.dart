import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/features/patient/vitals/data/models/vital_reading_model.dart';
import 'package:haya_care/features/patient/vitals/presentation/widgets/add_reading/vital_unit_field.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class VitalCategoryFields extends StatelessWidget {
  final VitalCategory category;
  final TextEditingController systolicController;
  final TextEditingController diastolicController;
  final TextEditingController singleValueController;
  final List<String> contextOptions;
  final int selectedContextIndex;
  final ValueChanged<int> onContextChanged;

  const VitalCategoryFields({
    super.key,
    required this.category,
    required this.systolicController,
    required this.diastolicController,
    required this.singleValueController,
    required this.contextOptions,
    required this.selectedContextIndex,
    required this.onContextChanged,
  });

  Widget _buildBloodPressure(S s) {
    return Row(
      children: [
        Expanded(child: VitalUnitField(label: s.systolicLabel, hint: '120', unit: s.bloodPressureUnit, controller: systolicController)),
        SizedBox(width: 12.w),
        Expanded(child: VitalUnitField(label: s.diastolicLabel, hint: '80', unit: s.bloodPressureUnit, controller: diastolicController)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final textTheme = context.textTheme;
    final colors = context.appColors;

    if (category == VitalCategory.bloodPressure) return _buildBloodPressure(s);

    final (valueLabel, hint, unit, dropdownLabel) = switch (category) {
      VitalCategory.bloodSugar => (s.sugarValueLabel, '104', s.bloodSugarUnit, s.measurementContextLabel),
      VitalCategory.weight => (s.weight, '82.4', s.weightUnit, s.measurementTimeLabel),
      VitalCategory.heartRate => (s.heartRate, '72', s.heartRateUnit, s.measurementStateLabel),
      VitalCategory.oxygen => (s.oxygenLabel, '98', s.oxygenUnit, s.measurementStateLabel),
      VitalCategory.temperature => (s.temperatureLabel, '36.8', s.temperatureUnit, s.measurementStateLabel),
      VitalCategory.bloodPressure => ('', '', '', ''),
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VitalUnitField(
          label: valueLabel,
          hint: hint,
          unit: unit,
          controller: singleValueController,
          decimal: category == VitalCategory.weight ||
              category == VitalCategory.temperature,
        ),
        SizedBox(height: 14.h),
        Text(
          dropdownLabel,
          style: textTheme.labelMedium?.copyWith(
            fontSize: 13.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 6.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: colors.cardBackground,
            borderRadius: BorderRadius.circular(14.r),
            border: Border.all(color: colors.borderColor),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<int>(
              value: selectedContextIndex.clamp(0, contextOptions.length - 1),
              isExpanded: true,
              dropdownColor: colors.cardBackground,
              borderRadius: BorderRadius.circular(14.r),
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: colors.primaryText,
              ),
              style: textTheme.bodyMedium?.copyWith(
                fontSize: 13.5.sp,
                color: colors.primaryText,
              ),
              onChanged: (idx) {
                if (idx != null) onContextChanged(idx);
              },
              items: List.generate(
                contextOptions.length,
                (i) => DropdownMenuItem(value: i, child: Text(contextOptions[i])),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
