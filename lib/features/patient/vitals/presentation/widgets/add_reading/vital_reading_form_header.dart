import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/features/patient/vitals/data/models/vital_reading_model.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class VitalReadingFormHeader extends StatelessWidget {
  final VitalCategory category;
  final bool isEditing;
  final VoidCallback onClose;
  final VoidCallback? onVoiceTap;

  const VitalReadingFormHeader({
    super.key,
    required this.category,
    required this.onClose,
    this.isEditing = false,
    this.onVoiceTap,
  });

  String _categoryLabel(S s) => switch (category) {
        VitalCategory.bloodPressure => s.bloodPressure,
        VitalCategory.bloodSugar => s.bloodSugar,
        VitalCategory.weight => s.weight,
        VitalCategory.heartRate => s.heartRate,
        VitalCategory.oxygen => s.oxygenLabel,
        VitalCategory.temperature => s.temperatureLabel,
      };

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final textTheme = context.textTheme;
    final colors = context.appColors;

    return Column(
      children: [
        Center(
          child: Container(
            width: 40.w,
            height: 4.h,
            decoration: BoxDecoration(color: colors.borderColor, borderRadius: BorderRadius.circular(2.r)),
          ),
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${isEditing ? s.editReadingTitle : s.addMeasurementTitle} · ${_categoryLabel(s)}',
                    style: textTheme.headlineMedium?.copyWith(fontSize: 20.sp, fontWeight: FontWeight.bold, color: colors.brandNavy),
                  ),
                  SizedBox(height: 2.h),
                  Text(s.addMeasurementSubtitle, style: textTheme.bodySmall?.copyWith(fontSize: 12.sp, color: colors.secondaryText)),
                ],
              ),
            ),
            if (onVoiceTap != null)
              IconButton(
                onPressed: onVoiceTap,
                tooltip: s.voiceInputButton,
                icon: Icon(Icons.mic_none_rounded, color: AppColors.orangeBadge, size: 22.sp),
              ),
            IconButton(
              onPressed: onClose,
              icon: Icon(Icons.close_rounded, color: colors.secondaryText, size: 22.sp),
            ),
          ],
        ),
      ],
    );
  }
}
