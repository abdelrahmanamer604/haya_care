import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/core/widgets/app_button.dart';
import 'package:haya_care/core/widgets/app_delete_outline_button.dart';
import 'package:haya_care/features/patient/vitals/presentation/widgets/add_reading/vital_picker_field.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class VitalReadingFormFooter extends StatelessWidget {
  final String? validationError;
  final DateTime selectedDate;
  final TimeOfDay selectedTime;
  final TextEditingController notesController;
  final VoidCallback onPickDate;
  final VoidCallback onPickTime;
  final VoidCallback onSave;
  final bool isEditing;
  final VoidCallback? onDelete;

  const VitalReadingFormFooter({
    super.key,
    required this.validationError,
    required this.selectedDate,
    required this.selectedTime,
    required this.notesController,
    required this.onPickDate,
    required this.onPickTime,
    required this.onSave,
    this.isEditing = false,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final textTheme = context.textTheme;
    final colors = context.appColors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (validationError != null) ...[
          SizedBox(height: 6.h),
          Text(
            validationError!,
            style: textTheme.labelSmall?.copyWith(
              fontSize: 11.5.sp,
              color: AppColors.heartRateRed,
            ),
          ),
        ],
        SizedBox(height: 14.h),
        Row(
          children: [
            Expanded(
              child: VitalPickerField(
                label: s.dateLabel,
                value:
                    '${selectedDate.year}/${selectedDate.month}/${selectedDate.day}',
                icon: Icons.calendar_today_outlined,
                onTap: onPickDate,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: VitalPickerField(
                label: s.timeLabel,
                value: selectedTime.format(context),
                icon: Icons.access_time_rounded,
                onTap: onPickTime,
              ),
            ),
          ],
        ),
        SizedBox(height: 14.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              s.notesLabel,
              style: textTheme.labelMedium?.copyWith(
                fontSize: 13.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              s.optionalLabel,
              style: textTheme.labelSmall?.copyWith(
                fontSize: 11.sp,
                color: colors.secondaryText,
              ),
            ),
          ],
        ),
        SizedBox(height: 6.h),
        TextField(
          controller: notesController,
          maxLines: 3,
          minLines: 2,
          style: textTheme.bodyMedium?.copyWith(fontSize: 13.sp),
          decoration: InputDecoration(hintText: s.notesHint),
        ),
        SizedBox(height: 14.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: colors.navySurface,
            borderRadius: BorderRadius.circular(14.r),
          ),
          child: Row(
            children: [
              Icon(
                Icons.favorite_border_rounded,
                size: 18.sp,
                color: colors.brandNavy,
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Text(
                  s.medicalDisclaimer,
                  style: textTheme.labelSmall?.copyWith(
                    fontSize: 11.sp,
                    color: colors.secondaryText,
                    height: 1.4,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 18.h),
        AppButton(
          text: isEditing ? s.updateButton : s.saveReading,
          variant: AppButtonVariant.primary,
          leadingIcon: Icons.check_rounded,
          height: 50.h,
          borderRadius: 16.r,
          onPressed: onSave,
        ),
        if (onDelete != null) ...[
          SizedBox(height: 10.h),
          AppDeleteOutlineButton(label: s.deleteButton, onPressed: onDelete!),
        ],
      ],
    );
  }
}
