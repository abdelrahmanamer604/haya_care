import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/features/patient/data/models/vital_item_model.dart';
import 'package:haya_care/features/patient/home/presentation/widgets/home_vital_card.dart';
import 'package:haya_care/features/patient/vitals/data/models/vital_reading_model.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class HomeVitalsSection extends StatelessWidget {
  final ValueChanged<VitalCategory>? onCategoryTap;

  const HomeVitalsSection({super.key, this.onCategoryTap});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final textTheme = context.textTheme;
    final colors = context.appColors;

    final vitals = [
      VitalItemModel(
        label: s.bloodPressure,
        value: '128/82',
        unit: s.bloodPressureUnit,
        timestamp: s.lastReadingTwoHours,
        icon: Icons.monitor_heart_outlined,
        iconColor: AppColors.orangeBadge,
        iconBgColor: colors.orangeSurface,
        onTap: () => onCategoryTap?.call(VitalCategory.bloodPressure),
      ),
      VitalItemModel(
        label: s.bloodSugar,
        value: '104',
        unit: s.bloodSugarUnit,
        timestamp: s.lastReadingFourHours,
        icon: Icons.water_drop_outlined,
        iconColor: colors.brandNavy,
        iconBgColor: colors.navySurface,
        onTap: () => onCategoryTap?.call(VitalCategory.bloodSugar),
      ),
      VitalItemModel(
        label: s.weight,
        value: '82.4',
        unit: s.weightUnit,
        timestamp: s.lastReadingMorning,
        icon: Icons.person_outline_rounded,
        iconColor: AppColors.successGreen,
        iconBgColor: colors.greenSurface,
        onTap: () => onCategoryTap?.call(VitalCategory.weight),
      ),
      VitalItemModel(
        label: s.heartRate,
        value: '72',
        unit: s.heartRateUnit,
        timestamp: s.lastReadingTodayTime,
        icon: Icons.favorite_border_rounded,
        iconColor: AppColors.heartRateRed,
        iconBgColor: colors.redSurface,
        onTap: () => onCategoryTap?.call(VitalCategory.heartRate),
      ),
      VitalItemModel(
        label: s.oxygenLabel,
        value: '98',
        unit: s.oxygenUnit,
        timestamp: s.lastReadingTodayTime,
        icon: Icons.air_rounded,
        iconColor: AppColors.primaryBlue,
        iconBgColor: colors.navySurface,
        onTap: () => onCategoryTap?.call(VitalCategory.oxygen),
      ),
      VitalItemModel(
        label: s.temperatureLabel,
        value: '36.8',
        unit: s.temperatureUnit,
        timestamp: s.lastReadingTodayTime,
        icon: Icons.thermostat_rounded,
        iconColor: AppColors.warningAmber,
        iconBgColor: colors.orangeSurface,
        onTap: () => onCategoryTap?.call(VitalCategory.temperature),
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(s.healthSummaryTitle, style: textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold, fontSize: 17.sp)),
        SizedBox(height: 2.h),
        Text(s.latestRecordedReadings, style: textTheme.labelSmall?.copyWith(fontSize: 11.sp)),
        SizedBox(height: 12.h),
        LayoutBuilder(
          builder: (context, constraints) {
            final cols = constraints.maxWidth >= 560 ? 3 : 2;
            return Column(
              children: [
                for (var i = 0; i < vitals.length; i += cols) ...[
                  if (i > 0) SizedBox(height: 12.h),
                  IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        for (var j = 0; j < cols; j++) ...[
                          if (j > 0) SizedBox(width: 12.w),
                          Expanded(child: i + j < vitals.length ? HomeVitalCard(vital: vitals[i + j]) : const SizedBox.shrink()),
                        ],
                      ],
                    ),
                  ),
                ],
              ],
            );
          },
        ),
      ],
    );
  }
}
