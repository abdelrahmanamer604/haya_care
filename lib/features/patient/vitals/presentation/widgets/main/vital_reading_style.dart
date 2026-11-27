import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/theme/app_theme.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/features/patient/vitals/data/models/vital_reading_model.dart';
import 'package:haya_care/l10n/app_localizations.dart';

(IconData, Color, Color) resolveVitalCategoryStyle(
  VitalCategory category,
  AppThemeColors colors,
) {
  return switch (category) {
    VitalCategory.bloodPressure => (
        Icons.monitor_heart_outlined,
        AppColors.orangeBadge,
        colors.orangeSurface,
      ),
    VitalCategory.bloodSugar => (
        Icons.water_drop_outlined,
        colors.brandNavy,
        colors.navySurface,
      ),
    VitalCategory.weight => (
        Icons.person_outline_rounded,
        colors.brandNavy,
        colors.navySurface,
      ),
    VitalCategory.heartRate => (
        Icons.favorite_border_rounded,
        colors.brandNavy,
        colors.navySurface,
      ),
    VitalCategory.oxygen => (
        Icons.air_rounded,
        colors.brandNavy,
        colors.navySurface,
      ),
    VitalCategory.temperature => (
        Icons.thermostat_outlined,
        AppColors.orangeBadge,
        colors.orangeSurface,
      ),
  };
}

(String, Color, Color) resolveVitalStatusStyle(
  VitalStatus status,
  S s,
  AppThemeColors colors,
) {
  return switch (status) {
    VitalStatus.normal => (
        s.normalStatus,
        AppColors.successGreen,
        colors.greenSurface,
      ),
    VitalStatus.stable => (
        s.stableStatus,
        AppColors.successGreen,
        colors.greenSurface,
      ),
    VitalStatus.followUp => (
        s.followUpStatus,
        AppColors.warningAmber,
        colors.warningSurface,
      ),
  };
}

class VitalStatusBadge extends StatelessWidget {
  final VitalStatus status;

  const VitalStatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final colors = context.appColors;
    final (label, color, bg) = resolveVitalStatusStyle(status, s, colors);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: context.textTheme.labelSmall?.copyWith(
              fontSize: 10.5.sp,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          SizedBox(width: 5.w),
          Container(
            width: 6.r,
            height: 6.r,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
        ],
      ),
    );
  }
}
