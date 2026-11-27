import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/core/widgets/tap_scale_widget.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class MedicationDoseCard extends StatelessWidget {
  final String name;
  final String dosage;
  final String schedule;
  final bool isTaken;
  final VoidCallback onToggleTaken;
  final VoidCallback? onEditTap;

  const MedicationDoseCard({
    super.key,
    required this.name,
    required this.dosage,
    required this.schedule,
    required this.isTaken,
    required this.onToggleTaken,
    this.onEditTap,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final colors = context.appColors;
    final textTheme = context.textTheme;
    final statusColor = isTaken ? AppColors.successGreen : AppColors.warningAmber;
    final statusBg = isTaken ? colors.greenSurface : colors.warningSurface;
    final btnColor = isTaken ? AppColors.successGreen : AppColors.orangeBadge;
    final btnBg = isTaken ? colors.greenSurface : colors.orangeSurface;

    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: colors.cardBackground,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: const [BoxShadow(color: AppColors.shadowColor, blurRadius: 12, offset: Offset(0, 3))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 44.r,
                height: 44.r,
                decoration: BoxDecoration(
                  color: colors.orangeSurface,
                  borderRadius: BorderRadius.circular(14.r),
                ),
                alignment: Alignment.center,
                child: Icon(Icons.medication_outlined,
                    color: AppColors.orangeBadge, size: 22.sp),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                        style: textTheme.titleSmall?.copyWith(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: colors.brandNavy)),
                    SizedBox(height: 2.h),
                    Text(dosage,
                        style: textTheme.labelSmall?.copyWith(
                            fontSize: 11.5.sp, color: colors.secondaryText)),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                decoration: BoxDecoration(color: statusBg, borderRadius: BorderRadius.circular(20.r)),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  Container(width: 6.r, height: 6.r, decoration: BoxDecoration(color: statusColor, shape: BoxShape.circle)),
                  SizedBox(width: 5.w),
                  Text(isTaken ? s.doseTakenBadge : s.doseUpcomingBadge, style: textTheme.labelSmall?.copyWith(fontSize: 11.sp, fontWeight: FontWeight.bold, color: statusColor)),
                ]),
              ),
              if (onEditTap != null) ...[
                SizedBox(width: 6.w),
                InkWell(
                  onTap: onEditTap,
                  borderRadius: BorderRadius.circular(10.r),
                  child: Padding(padding: EdgeInsets.all(6.r), child: Icon(Icons.edit_outlined, size: 18.sp, color: colors.secondaryText)),
                ),
              ],
            ],
          ),
          SizedBox(height: 12.h),
          Divider(height: 1, color: colors.borderColor.withValues(alpha: 0.5)),
          SizedBox(height: 10.h),
          Row(
            children: [
              Icon(Icons.calendar_today_outlined, size: 13.sp, color: colors.secondaryText),
              SizedBox(width: 6.w),
              Expanded(
                child: Text(schedule,
                    style: textTheme.labelSmall
                        ?.copyWith(fontSize: 11.sp, color: colors.secondaryText)),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          TapScaleWidget(
            scale: 0.96,
            onTap: () {
              HapticFeedback.lightImpact();
              onToggleTaken();
            },
            child: Container(
              width: double.infinity,
              height: 44.h,
              decoration: BoxDecoration(
                color: btnBg,
                borderRadius: BorderRadius.circular(14.r),
                border: isTaken ? null : Border.all(color: btnColor),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.check_rounded, color: btnColor, size: 18.sp),
                  SizedBox(width: 6.w),
                  Text(
                    isTaken ? s.doseLoggedButton : s.logDoseButton,
                    style: textTheme.labelMedium?.copyWith(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                        color: btnColor),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
