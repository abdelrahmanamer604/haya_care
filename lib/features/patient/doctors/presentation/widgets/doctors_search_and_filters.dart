import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/core/widgets/app_text_field.dart';
import 'package:haya_care/features/patient/doctors/data/models/doctor_model.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class DoctorsSearchAndFilters extends StatelessWidget {
  final TextEditingController searchController;
  final DoctorSpecialtyFilter selectedFilter;
  final ValueChanged<String> onSearchChanged;
  final ValueChanged<DoctorSpecialtyFilter> onFilterSelected;

  const DoctorsSearchAndFilters({
    super.key,
    required this.searchController,
    required this.selectedFilter,
    required this.onSearchChanged,
    required this.onFilterSelected,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final colors = context.appColors;
    final textTheme = context.textTheme;

    final filters = [
      (DoctorSpecialtyFilter.all, s.filterAll),
      (DoctorSpecialtyFilter.familyMedicine, s.filterFamilyMedicine),
      (DoctorSpecialtyFilter.diabetes, s.filterDiabetes),
      (DoctorSpecialtyFilter.cardiology, s.filterCardiology),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextField(
          controller: searchController,
          hintText: s.doctorsSearchHint,
          prefixIcon: Icons.search_rounded,
          fillColor: colors.cardBackground,
          borderColor: colors.borderColor,
          focusedBorderColor: colors.brandNavy,
        ),
        SizedBox(height: 12.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: filters.map((item) {
              final isSelected = item.$1 == selectedFilter;
              return Padding(
                padding: EdgeInsetsDirectional.only(end: 8.w),
                child: GestureDetector(
                  onTap: () => onFilterSelected(item.$1),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 220),
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.w,
                      vertical: 8.h,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? colors.brandNavy
                          : colors.cardBackground,
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(
                        color: isSelected
                            ? colors.brandNavy
                            : colors.borderColor,
                      ),
                    ),
                    child: Text(
                      item.$2,
                      style: textTheme.labelMedium?.copyWith(
                        fontSize: 12.sp,
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.w500,
                        color: isSelected
                            ? AppColors.white
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
