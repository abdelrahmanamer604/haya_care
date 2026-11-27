import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class HomeHealthChartLegend extends StatelessWidget {
  const HomeHealthChartLegend({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final textTheme = context.textTheme;
    final colors = context.appColors;

    return Wrap(
      spacing: 14.w,
      runSpacing: 6.h,
      children: [
        _LegendDot(
          textTheme: textTheme,
          color: AppColors.orangeBadge,
          label: s.bloodPressure,
        ),
        _LegendDot(
          textTheme: textTheme,
          color: colors.brandNavy,
          label: s.bloodSugar,
        ),
        _LegendDot(
          textTheme: textTheme,
          color: AppColors.successGreen,
          label: s.weight,
        ),
        _LegendDot(
          textTheme: textTheme,
          color: AppColors.heartRateRed,
          label: s.heartRate,
        ),
        _LegendDot(
          textTheme: textTheme,
          color: AppColors.primaryBlue,
          label: s.oxygenLabel,
        ),
        _LegendDot(
          textTheme: textTheme,
          color: AppColors.warningAmber,
          label: s.temperatureLabel,
        ),
      ],
    );
  }
}

class _LegendDot extends StatelessWidget {
  final TextTheme textTheme;
  final Color color;
  final String label;

  const _LegendDot({
    required this.textTheme,
    required this.color,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 7.r,
          height: 7.r,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        SizedBox(width: 5.w),
        Text(
          label,
          style: textTheme.labelSmall?.copyWith(fontSize: 10.5.sp),
        ),
      ],
    );
  }
}

class HomeChartDaysRow extends StatelessWidget {
  const HomeChartDaysRow({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final textTheme = context.textTheme;
    final days = [s.sat, s.sun, s.mon, s.tue, s.wed, s.thu, s.fri];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: days
          .map(
            (day) => Expanded(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Text(
                    day,
                    style: textTheme.labelSmall?.copyWith(fontSize: 9.5.sp),
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
