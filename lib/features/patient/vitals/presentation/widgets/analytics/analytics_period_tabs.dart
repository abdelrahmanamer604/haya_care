import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/features/patient/vitals/presentation/controllers/patient_analytics_controller.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class AnalyticsPeriodTabs extends StatelessWidget {
  final AnalyticsPeriod selectedPeriod;
  final ValueChanged<AnalyticsPeriod> onSelected;

  const AnalyticsPeriodTabs({
    super.key,
    required this.selectedPeriod,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final textTheme = context.textTheme;
    final colors = context.appColors;

    final tabs = [
      (period: AnalyticsPeriod.daily, label: s.daily),
      (period: AnalyticsPeriod.weekly, label: s.weekly),
      (period: AnalyticsPeriod.monthly, label: s.monthly),
    ];

    final selectedIndex =
        tabs.indexWhere((t) => t.period == selectedPeriod).clamp(0, 2);
    final alignmentX = -1.0 + (2.0 * selectedIndex / (tabs.length - 1));

    return Container(
      height: 46.h,
      padding: EdgeInsets.all(4.r),
      decoration: BoxDecoration(
        color: colors.inputBackground,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Stack(
        children: [
          AnimatedAlign(
            alignment: AlignmentDirectional(alignmentX, 0),
            duration: const Duration(milliseconds: 340),
            curve: Curves.easeOutBack,
            child: FractionallySizedBox(
              widthFactor: 1 / tabs.length,
              heightFactor: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: colors.cardBackground,
                  borderRadius: BorderRadius.circular(11.r),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.shadowColor,
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            children: tabs.map((tab) {
              final isSelected = tab.period == selectedPeriod;
              return Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    if (!isSelected) {
                      HapticFeedback.selectionClick();
                      onSelected(tab.period);
                    }
                  },
                  child: Center(
                    child: AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 220),
                      style: textTheme.labelSmall!.copyWith(
                        fontSize: 12.5.sp,
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.w500,
                        color: isSelected
                            ? colors.brandNavy
                            : colors.secondaryText,
                      ),
                      child: Text(tab.label),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
