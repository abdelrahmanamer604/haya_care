import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class MedicationsSummaryBanner extends StatelessWidget {
  final int activeCount;
  final String adherencePercent;

  const MedicationsSummaryBanner({
    super.key,
    required this.activeCount,
    required this.adherencePercent,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final textTheme = context.textTheme;
    final dividerColor = AppColors.white.withValues(alpha: 0.16);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: AppColors.splashBackground,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              child: _StatColumn(
                top: Text(
                  '$activeCount',
                  style: textTheme.headlineSmall?.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
                label: s.activeMedicationsCount,
              ),
            ),
            VerticalDivider(width: 1, color: dividerColor),
            Expanded(
              child: _StatColumn(
                top: Text(
                  adherencePercent,
                  style: textTheme.headlineSmall?.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
                label: s.adherenceThisMonth,
              ),
            ),
            VerticalDivider(width: 1, color: dividerColor),
            Expanded(
              child: _StatColumn(
                top: Icon(
                  Icons.notifications_none_rounded,
                  color: AppColors.white,
                  size: 22.sp,
                ),
                label: s.remindersActiveStatus,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatColumn extends StatelessWidget {
  final Widget top;
  final String label;

  const _StatColumn({required this.top, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        top,
        SizedBox(height: 4.h),
        Text(
          label,
          textAlign: TextAlign.center,
          style: context.textTheme.labelSmall?.copyWith(
            fontSize: 10.sp,
            color: AppColors.splashSubtitleText,
          ),
        ),
      ],
    );
  }
}
