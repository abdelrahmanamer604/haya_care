import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/theme/app_theme.dart';

LineChartData buildHomeHealthChartData({
  required int selectedPeriod,
  required AppThemeColors colors,
  required TextTheme textTheme,
}) {
  final shift = selectedPeriod * 6.0;
  final bpValues = [68.0, 54.0, 65.0, 48.0, 76.0, 58.0, 84.0]
      .map((v) => (v + shift).clamp(20.0, 95.0))
      .toList();
  final sugarValues = [46.0, 50.0, 52.0, 44.0, 54.0, 58.0, 62.0]
      .map((v) => (v - shift * 0.5).clamp(20.0, 95.0))
      .toList();
  const weightValues = [30.0, 32.0, 34.0, 31.0, 36.0, 38.0, 41.0];
  const hrValues = [48.0, 58.0, 44.0, 54.0, 46.0, 62.0, 70.0];
  final oxygenValues = [95.0, 96.0, 97.0, 96.0, 98.0, 97.0, 98.0]
      .map((v) => (v - shift * 0.2).clamp(20.0, 99.0))
      .toList();
  const tempValues = [36.6, 36.7, 36.8, 37.0, 36.8, 36.9, 36.7];

  return LineChartData(
    minX: 0,
    maxX: 6,
    minY: 15,
    maxY: 100,
    gridData: FlGridData(
      show: true,
      drawVerticalLine: false,
      horizontalInterval: 25,
      getDrawingHorizontalLine: (value) => FlLine(
        color: colors.borderColor.withValues(alpha: 0.7),
        strokeWidth: 1,
      ),
    ),
    titlesData: const FlTitlesData(show: false),
    borderData: FlBorderData(show: false),
    lineTouchData: LineTouchData(
      touchTooltipData: LineTouchTooltipData(
        getTooltipColor: (_) => colors.cardBackground,
        tooltipBorder: BorderSide(color: colors.borderColor),
        getTooltipItems: (touchedSpots) => touchedSpots.map((spot) {
          return LineTooltipItem(
            spot.y.toStringAsFixed(0),
            textTheme.labelSmall!.copyWith(
              fontSize: 10.sp,
              fontWeight: FontWeight.bold,
              color: spot.bar.color ?? colors.primaryText,
            ),
          );
        }).toList(),
      ),
    ),
    lineBarsData: [
      _buildLineBar(
        values: weightValues,
        color: AppColors.successGreen,
        dashed: true,
        dotStrokeColor: colors.cardBackground,
      ),
      _buildLineBar(
        values: hrValues,
        color: AppColors.heartRateRed,
        dashed: true,
        dotStrokeColor: colors.cardBackground,
      ),
      _buildLineBar(
        values: sugarValues,
        color: colors.brandNavy,
        dashed: true,
        dotStrokeColor: colors.cardBackground,
      ),
      _buildLineBar(
        values: bpValues,
        color: AppColors.orangeBadge,
        dashed: false,
        dotStrokeColor: colors.cardBackground,
      ),
      _buildLineBar(
        values: oxygenValues,
        color: AppColors.primaryBlue,
        dashed: true,
        dotStrokeColor: colors.cardBackground,
      ),
      _buildLineBar(
        values: tempValues,
        color: AppColors.warningAmber,
        dashed: true,
        dotStrokeColor: colors.cardBackground,
      ),
    ],
  );
}

LineChartBarData _buildLineBar({
  required List<double> values,
  required Color color,
  required bool dashed,
  required Color dotStrokeColor,
}) {
  return LineChartBarData(
    spots: List.generate(
      values.length,
      (i) => FlSpot(i.toDouble(), values[i]),
    ),
    isCurved: true,
    preventCurveOverShooting: true,
    color: color,
    barWidth: dashed ? 1.8 : 2.4,
    isStrokeCapRound: true,
    dashArray: dashed ? [5, 4] : null,
    dotData: FlDotData(
      show: !dashed,
      checkToShowDot: (spot, _) => spot.x == 3 || spot.x == 6,
      getDotPainter: (spot, percent, barData, index) => FlDotCirclePainter(
        radius: 3.5,
        color: color,
        strokeWidth: 1.5,
        strokeColor: dotStrokeColor,
      ),
    ),
    belowBarData: BarAreaData(
      show: !dashed,
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          color.withValues(alpha: 0.14),
          color.withValues(alpha: 0.0),
        ],
      ),
    ),
  );
}
