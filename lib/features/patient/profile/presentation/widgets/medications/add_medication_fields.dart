import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';

class AddMedicationField extends StatelessWidget {
  final String label, hint;
  final TextEditingController controller;
  final IconData? prefixIcon;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;

  const AddMedicationField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.prefixIcon,
    this.textInputAction = TextInputAction.next,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final textTheme = context.textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: textTheme.labelMedium?.copyWith(fontSize: 12.sp, fontWeight: FontWeight.bold, color: colors.brandNavy)),
        SizedBox(height: 7.h),
        TextFormField(
          controller: controller,
          textInputAction: textInputAction,
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: textTheme.bodySmall?.copyWith(fontSize: 13.sp),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: textTheme.bodySmall?.copyWith(fontSize: 12.5.sp, color: colors.secondaryText.withValues(alpha: 0.7)),
            prefixIcon: prefixIcon != null ? Icon(prefixIcon, size: 19.sp, color: colors.secondaryText) : null,
            filled: true,
            fillColor: colors.cardBackground,
            contentPadding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 15.h),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r), borderSide: BorderSide(color: colors.borderColor)),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r), borderSide: BorderSide(color: colors.borderColor)),
          ),
        ),
      ],
    );
  }
}

class AddMedicationTimeField extends StatelessWidget {
  final String label, displayValue;
  final bool hasValue;
  final VoidCallback onTap;

  const AddMedicationTimeField({
    super.key,
    required this.label,
    required this.displayValue,
    required this.hasValue,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final textTheme = context.textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: textTheme.labelMedium?.copyWith(fontSize: 12.sp, fontWeight: FontWeight.bold, color: colors.brandNavy)),
        SizedBox(height: 7.h),
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12.r),
          child: Container(
            width: double.infinity,
            height: 52.h,
            padding: EdgeInsets.symmetric(horizontal: 13.w),
            decoration: BoxDecoration(
              color: colors.cardBackground,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: colors.borderColor),
            ),
            child: Row(
              children: [
                Icon(Icons.access_time_rounded, size: 18.sp, color: colors.secondaryText),
                SizedBox(width: 10.w),
                Expanded(
                  child: Text(
                    displayValue,
                    style: textTheme.bodySmall?.copyWith(
                      fontSize: 13.sp,
                      color: hasValue ? colors.primaryText : colors.secondaryText.withValues(alpha: 0.7),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class AddMedicationReminderRow extends StatelessWidget {
  final String title, subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const AddMedicationReminderRow({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final textTheme = context.textTheme;
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: textTheme.labelMedium?.copyWith(fontSize: 12.sp, fontWeight: FontWeight.bold, color: colors.brandNavy)),
              SizedBox(height: 2.h),
              Text(subtitle, style: textTheme.labelSmall?.copyWith(fontSize: 10.sp, color: colors.secondaryText)),
            ],
          ),
        ),
        Switch(value: value, activeThumbColor: AppColors.white, activeTrackColor: AppColors.successGreen, onChanged: onChanged),
      ],
    );
  }
}
