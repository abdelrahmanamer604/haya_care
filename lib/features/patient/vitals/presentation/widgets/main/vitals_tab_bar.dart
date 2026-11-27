import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/features/patient/vitals/data/models/vital_reading_model.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class VitalsTabBar extends StatelessWidget {
  final VitalCategory selectedCategory;
  final ValueChanged<VitalCategory> onChanged;

  const VitalsTabBar({
    super.key,
    required this.selectedCategory,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final textTheme = context.textTheme;
    final colors = context.appColors;

    final tabs = [
      (category: VitalCategory.bloodPressure, label: s.bloodPressure),
      (category: VitalCategory.bloodSugar, label: s.bloodSugar),
      (category: VitalCategory.weight, label: s.weight),
      (category: VitalCategory.heartRate, label: s.heartRate),
      (category: VitalCategory.oxygen, label: s.oxygenLabel),
      (category: VitalCategory.temperature, label: s.temperatureLabel),
    ];

    return Container(
      height: 46.h,
      padding: EdgeInsets.all(4.r),
      decoration: BoxDecoration(
        color: colors.inputBackground,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: tabs.map((tab) {
            final isSelected = tab.category == selectedCategory;
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                if (!isSelected) {
                  HapticFeedback.selectionClick();
                  onChanged(tab.category);
                }
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 220),
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 7.h),
                decoration: BoxDecoration(
                  color: isSelected ? colors.cardBackground : AppColors.transparent,
                  borderRadius: BorderRadius.circular(11.r),
                  boxShadow: isSelected
                      ? const [BoxShadow(color: AppColors.shadowColor, blurRadius: 8, offset: Offset(0, 2))]
                      : null,
                ),
                alignment: Alignment.center,
                child: Text(
                  tab.label,
                  maxLines: 1,
                  style: textTheme.labelSmall?.copyWith(
                    fontSize: 11.5.sp,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                    color: isSelected ? colors.brandNavy : colors.secondaryText,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
