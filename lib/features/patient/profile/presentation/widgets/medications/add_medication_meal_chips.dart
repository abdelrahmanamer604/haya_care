import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/features/patient/profile/presentation/controllers/add_medication_controller.dart';

class AddMedicationMealChips extends StatelessWidget {
  final String label;
  final Map<MealTimingOption, String> options;
  final MealTimingOption? selected;
  final ValueChanged<MealTimingOption> onSelected;

  const AddMedicationMealChips({
    super.key,
    required this.label,
    required this.options,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final textTheme = context.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: textTheme.labelMedium?.copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
            color: colors.brandNavy,
          ),
        ),
        SizedBox(height: 8.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: options.entries.map((entry) {
              final isSelected = selected == entry.key;
              return Padding(
                padding: EdgeInsetsDirectional.only(end: 8.w),
                child: InkWell(
                  onTap: () {
                    HapticFeedback.selectionClick();
                    onSelected(entry.key);
                  },
                  borderRadius: BorderRadius.circular(20.r),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 180),
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? colors.orangeSurface
                          : colors.cardBackground,
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(
                        color: isSelected
                            ? AppColors.orangeBadge
                            : colors.borderColor,
                      ),
                    ),
                    child: Text(
                      entry.value,
                      style: textTheme.labelSmall?.copyWith(
                        fontSize: 11.sp,
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.w500,
                        color: isSelected
                            ? AppColors.orangeBadge
                            : colors.secondaryText,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
