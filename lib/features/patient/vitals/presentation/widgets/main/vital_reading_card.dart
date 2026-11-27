import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/core/widgets/tap_scale_widget.dart';
import 'package:haya_care/features/patient/vitals/data/models/vital_reading_model.dart';
import 'package:haya_care/features/patient/vitals/presentation/widgets/main/vital_reading_style.dart';

class VitalReadingCard extends StatelessWidget {
  final VitalReadingModel reading;
  final VoidCallback? onTap;

  const VitalReadingCard({super.key, required this.reading, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final textTheme = context.textTheme;
    final colors = context.appColors;
    final (icon, iconColor, iconBg) =
        resolveVitalCategoryStyle(reading.category, colors);

    return TapScaleWidget(
      scale: 1.015,
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(14.r),
        decoration: BoxDecoration(
          color: theme.cardTheme.color,
          borderRadius: BorderRadius.circular(18.r),
          boxShadow: const [
            BoxShadow(
              color: AppColors.shadowColor,
              blurRadius: 12,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 44.r,
              height: 44.r,
              decoration: BoxDecoration(
                color: iconBg,
                borderRadius: BorderRadius.circular(13.r),
              ),
              alignment: Alignment.center,
              child: Icon(icon, color: iconColor, size: 21.sp),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Flexible(
                        child: Text(
                          reading.value,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.labelMedium?.copyWith(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: colors.brandNavy,
                          ),
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Flexible(
                        fit: FlexFit.loose,
                        child: Text(
                          reading.unit,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.labelSmall?.copyWith(
                            fontSize: 11.sp,
                            color: colors.secondaryText,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          reading.timeLabel,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.labelSmall?.copyWith(
                            fontSize: 10.5.sp,
                            color: colors.secondaryText,
                          ),
                        ),
                      ),
                      if (reading.note.isNotEmpty) ...[
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6.w),
                          child: Text(
                            '·',
                            style: textTheme.labelSmall?.copyWith(
                              fontSize: 11.sp,
                              color: colors.secondaryText,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            reading.note,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: textTheme.labelSmall?.copyWith(
                              fontSize: 10.5.sp,
                              color: colors.secondaryText,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: 8.w),
            VitalStatusBadge(status: reading.status),
          ],
        ),
      ),
    );
  }
}
