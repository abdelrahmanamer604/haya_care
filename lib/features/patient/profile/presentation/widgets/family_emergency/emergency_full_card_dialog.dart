import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/features/patient/profile/presentation/controllers/family_emergency_controller.dart';
import 'package:haya_care/l10n/app_localizations.dart';

Future<void> showEmergencyFullCardDialog(
  BuildContext context,
  FamilyEmergencyController controller,
) {
  return showDialog<void>(
    context: context,
    barrierColor: AppColors.black.withValues(alpha: 0.45),
    builder: (_) => EmergencyFullCardDialog(controller: controller),
  );
}

class EmergencyFullCardDialog extends StatelessWidget {
  final FamilyEmergencyController controller;

  const EmergencyFullCardDialog({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final colors = context.appColors;
    final textTheme = context.textTheme;
    final divider = Divider(height: 1, color: colors.borderColor.withValues(alpha: 0.5));

    return Dialog(
      backgroundColor: colors.cardBackground,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.r)),
      insetPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 18.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () => context.pop(),
                  borderRadius: BorderRadius.circular(10.r),
                  child: Container(
                    width: 34.r,
                    height: 34.r,
                    decoration: BoxDecoration(color: colors.inputBackground, borderRadius: BorderRadius.circular(10.r)),
                    alignment: Alignment.center,
                    child: Icon(Icons.close_rounded, size: 18.sp, color: colors.primaryText),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.favorite_border_rounded, color: colors.brandNavy, size: 20.sp),
                      SizedBox(width: 6.w),
                      RichText(
                        text: TextSpan(
                          style: textTheme.titleMedium?.copyWith(fontSize: 17.sp, fontWeight: FontWeight.bold, color: colors.brandNavy),
                          children: [
                            const TextSpan(text: 'Haya'),
                            TextSpan(text: 'Care', style: textTheme.titleMedium?.copyWith(fontSize: 17.sp, fontWeight: FontWeight.bold, color: AppColors.orangeBadge)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 34.r),
              ],
            ),
            SizedBox(height: 18.h),
            Container(
              width: 156.r,
              height: 156.r,
              decoration: BoxDecoration(
                color: colors.cardBackground,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: AppColors.splashBackground, width: 2.5),
              ),
              alignment: Alignment.center,
              child: Icon(Icons.qr_code_2_rounded, size: 132.r, color: AppColors.splashBackground),
            ),
            SizedBox(height: 14.h),
            Text(s.profileDemoName, style: textTheme.titleLarge?.copyWith(fontSize: 18.sp, fontWeight: FontWeight.bold, color: colors.brandNavy)),
            SizedBox(height: 6.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 4.h),
              decoration: BoxDecoration(color: colors.redSurface, borderRadius: BorderRadius.circular(10.r)),
              child: Text(s.bloodTypeOPlus, style: textTheme.labelMedium?.copyWith(fontSize: 13.sp, fontWeight: FontWeight.bold, color: AppColors.heartRateRed)),
            ),
            SizedBox(height: 14.h),
            _FullCardRow(label: s.conditionsShortLabel, value: s.knownConditionsValue),
            divider,
            _FullCardRow(label: s.allergiesTitle, value: controller.allergy),
            divider,
            _FullCardRow(label: s.medicationsShortLabel, value: s.importantMedsValue),
            divider,
            _FullCardRow(label: s.emergencyShortLabel, value: '${controller.contactName}\n${controller.phone}', isLtrValue: true),
            SizedBox(height: 14.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.lock_outline_rounded, size: 13.sp, color: colors.secondaryText),
                SizedBox(width: 5.w),
                Flexible(
                  child: Text(s.fullCardDisclaimer, textAlign: TextAlign.center, style: textTheme.labelSmall?.copyWith(fontSize: 10.sp, color: colors.secondaryText)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _FullCardRow extends StatelessWidget {
  final String label, value;
  final bool isLtrValue;
  const _FullCardRow({required this.label, required this.value, this.isLtrValue = false});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final textTheme = context.textTheme;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 9.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: textTheme.labelSmall?.copyWith(fontSize: 11.5.sp, color: colors.secondaryText)),
          SizedBox(width: 12.w),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.end,
              textDirection: isLtrValue ? TextDirection.ltr : null,
              style: textTheme.labelMedium?.copyWith(fontSize: 12.sp, fontWeight: FontWeight.bold, color: colors.brandNavy),
            ),
          ),
        ],
      ),
    );
  }
}
