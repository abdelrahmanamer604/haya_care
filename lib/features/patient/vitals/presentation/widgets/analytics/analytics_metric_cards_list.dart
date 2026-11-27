import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/features/patient/vitals/presentation/widgets/analytics/analytics_metric_card.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class AnalyticsMetricCardsList extends StatelessWidget {
  final double shift;
  final List<String> xLabels;

  const AnalyticsMetricCardsList({
    super.key,
    required this.shift,
    required this.xLabels,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final colors = context.appColors;

    return Column(
      children: [
        AnalyticsMetricCard(
          title: s.bloodPressure,
          subtitle: s.systolicAndDiastolic,
          icon: Icons.monitor_heart_outlined,
          iconColor: AppColors.orangeBadge,
          avgValue: '128/82',
          minValue: '118/76',
          maxValue: '136/88',
          primaryPoints: [120, 126, 124, 130, 128, 132, 136]
              .map((v) => v + shift)
              .toList(),
          primaryLineColor: AppColors.orangeBadge,
          secondaryPoints: [76, 80, 79, 83, 81, 84, 88]
              .map((v) => v + shift * 0.5)
              .toList(),
          secondaryLineColor: colors.brandNavy,
          minY: 65,
          maxY: 145,
          xLabels: xLabels,
        ),
        SizedBox(height: 16.h),
        AnalyticsMetricCard(
          title: s.bloodSugar,
          subtitle: s.mgPerDlFull,
          icon: Icons.water_drop_outlined,
          iconColor: AppColors.orangeBadge,
          avgValue: '106',
          minValue: '92',
          maxValue: '142',
          primaryPoints: [92, 108, 104, 122, 114, 134, 130]
              .map((v) => v + shift)
              .toList(),
          primaryLineColor: AppColors.orangeBadge,
          minY: 75,
          maxY: 150,
          xLabels: xLabels,
        ),
        SizedBox(height: 16.h),
        AnalyticsMetricCard(
          title: s.weight,
          subtitle: s.kilogramsFull,
          icon: Icons.person_outline_rounded,
          iconColor: AppColors.successGreen,
          avgValue: '82.7',
          minValue: '82.4',
          maxValue: '83.1',
          primaryPoints: [83.1, 83.0, 82.9, 82.8, 82.7, 82.5, 82.4]
              .map((v) => v + shift * 0.05)
              .toList(),
          primaryLineColor: AppColors.successGreen,
          minY: 81.5,
          maxY: 84.0,
          xLabels: xLabels,
        ),
        SizedBox(height: 16.h),
        AnalyticsMetricCard(
          title: s.heartRate,
          subtitle: s.beatsPerMinuteFull,
          icon: Icons.favorite_border_rounded,
          iconColor: AppColors.heartRateRed,
          avgValue: '73',
          minValue: '65',
          maxValue: '88',
          primaryPoints: [66, 72, 70, 76, 74, 86, 80]
              .map((v) => v + shift * 0.6)
              .toList(),
          primaryLineColor: AppColors.heartRateRed,
          minY: 58,
          maxY: 95,
          xLabels: xLabels,
        ),
        SizedBox(height: 16.h),
        AnalyticsMetricCard(
          title: s.oxygenLabel,
          subtitle: s.oxygenSaturationFull,
          icon: Icons.air_rounded,
          iconColor: AppColors.primaryBlue,
          avgValue: '98%',
          minValue: '96%',
          maxValue: '99%',
          primaryPoints: [97, 98, 98, 99, 97, 98, 99].map((v) => v + shift * 0.1).toList(),
          primaryLineColor: AppColors.primaryBlue,
          minY: 93,
          maxY: 100,
          xLabels: xLabels,
        ),
        SizedBox(height: 16.h),
        AnalyticsMetricCard(
          title: s.temperatureLabel,
          subtitle: s.bodyTemperatureFull,
          icon: Icons.thermostat_rounded,
          iconColor: AppColors.warningAmber,
          avgValue: '36.8',
          minValue: '36.5',
          maxValue: '37.1',
          primaryPoints: [36.6, 36.7, 36.8, 37.0, 36.8, 36.9, 36.7].map((v) => v + shift * 0.05).toList(),
          primaryLineColor: AppColors.warningAmber,
          minY: 35.5,
          maxY: 38.5,
          xLabels: xLabels,
        ),
      ],
    );
  }
}
