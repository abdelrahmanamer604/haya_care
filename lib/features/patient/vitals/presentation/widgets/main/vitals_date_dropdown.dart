import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/features/patient/vitals/data/models/vital_reading_model.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class VitalsDateDropdown extends StatelessWidget {
  final VitalDateFilter selectedFilter;
  final ValueChanged<VitalDateFilter> onChanged;

  const VitalsDateDropdown({
    super.key,
    required this.selectedFilter,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final colors = context.appColors;
    final textTheme = context.textTheme;

    return Container(
      height: 36.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: colors.cardBackground,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: colors.borderColor),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<VitalDateFilter>(
          value: selectedFilter,
          isDense: true,
          borderRadius: BorderRadius.circular(14.r),
          dropdownColor: colors.cardBackground,
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            size: 18.sp,
            color: colors.primaryText,
          ),
          style: textTheme.labelMedium?.copyWith(
            fontSize: 12.sp,
            color: colors.primaryText,
          ),
          onChanged: (value) {
            if (value != null) onChanged(value);
          },
          items: [
            DropdownMenuItem(
              value: VitalDateFilter.last7Days,
              child: Text(s.last7Days),
            ),
            DropdownMenuItem(
              value: VitalDateFilter.last30Days,
              child: Text(s.last30Days),
            ),
            DropdownMenuItem(
              value: VitalDateFilter.all,
              child: Text(s.allReadings),
            ),
          ],
        ),
      ),
    );
  }
}
