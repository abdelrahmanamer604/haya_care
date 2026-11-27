import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/utils/extensions.dart';

class AnalyticsMetricChart extends StatelessWidget {
  final List<double> primaryPoints;
  final Color primaryLineColor;
  final List<double>? secondaryPoints;
  final Color? secondaryLineColor;
  final double minY;
  final double maxY;

  const AnalyticsMetricChart({
    super.key,
    required this.primaryPoints,
    required this.primaryLineColor,
    this.secondaryPoints,
    this.secondaryLineColor,
    required this.minY,
    required this.maxY,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colors = context.appColors;

    return SizedBox(
      height: 92.h,
      width: double.infinity,
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: (primaryPoints.length - 1).toDouble(),
          minY: minY,
          maxY: maxY,
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            horizontalInterval: (maxY - minY) / 3,
            getDrawingHorizontalLine: (_) => FlLine(
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
              getTooltipItems: (spots) => spots.map((spot) {
                return LineTooltipItem(
                  spot.y.toStringAsFixed(spot.y % 1 == 0 ? 0 : 1),
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
            _buildLine(primaryPoints, primaryLineColor),
            if (secondaryPoints != null && secondaryLineColor != null)
              _buildLine(secondaryPoints!, secondaryLineColor!),
          ],
        ),
        duration: const Duration(milliseconds: 380),
        curve: Curves.easeOutCubic,
      ),
    );
  }

  LineChartBarData _buildLine(List<double> values, Color color) {
    return LineChartBarData(
      spots: List.generate(
        values.length,
        (i) => FlSpot(i.toDouble(), values[i]),
      ),
      isCurved: true,
      preventCurveOverShooting: true,
      color: color,
      barWidth: 2.3,
      isStrokeCapRound: true,
      dotData: const FlDotData(show: false),
      belowBarData: BarAreaData(show: false),
    );
  }
}
