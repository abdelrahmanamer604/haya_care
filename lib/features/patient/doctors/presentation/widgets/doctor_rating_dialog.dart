import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/l10n/app_localizations.dart';

Future<int?> showDoctorRatingDialog(BuildContext context, String doctorName) {
  final s = S.of(context)!;
  final colors = context.appColors;
  var selected = 5;

  return showDialog<int>(
    context: context,
    builder: (ctx) => StatefulBuilder(
      builder: (ctx, setState) => AlertDialog(
        backgroundColor: colors.cardBackground,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
        title: Text(s.rateDoctorButton, style: context.textTheme.titleMedium?.copyWith(color: colors.brandNavy, fontWeight: FontWeight.bold)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(doctorName, style: context.textTheme.bodySmall?.copyWith(color: colors.secondaryText)),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (i) {
                final star = i + 1;
                return IconButton(
                  padding: EdgeInsets.all(4.w),
                  constraints: const BoxConstraints(),
                  visualDensity: VisualDensity.compact,
                  onPressed: () => setState(() => selected = star),
                  icon: Icon(
                    star <= selected ? Icons.star_rounded : Icons.star_border_rounded,
                    color: AppColors.warningAmber,
                    size: 30.sp,
                  ),
                );
              }),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(s.cancelButton, style: context.textTheme.labelMedium?.copyWith(color: colors.secondaryText)),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(ctx).pop(selected),
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.splashBackground, foregroundColor: AppColors.white),
            child: Text(s.saveChangesButton, style: context.textTheme.labelMedium?.copyWith(color: AppColors.white, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    ),
  );
}
