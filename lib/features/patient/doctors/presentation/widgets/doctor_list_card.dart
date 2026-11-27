import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/core/widgets/tap_scale_widget.dart';
import 'package:haya_care/features/patient/doctors/data/models/doctor_model.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class DoctorListCard extends StatelessWidget {
  final DoctorModel doctor;
  final VoidCallback onTap;

  const DoctorListCard({
    super.key,
    required this.doctor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final colors = context.appColors;
    final textTheme = context.textTheme;

    return TapScaleWidget(
      scale: 0.98,
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: colors.cardBackground,
          borderRadius: BorderRadius.circular(20.r),
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
              width: 54.r,
              height: 54.r,
              decoration: BoxDecoration(
                color: colors.navySurface,
                borderRadius: BorderRadius.circular(16.r),
              ),
              alignment: Alignment.center,
              child: Text(
                doctor.initials,
                style: textTheme.titleMedium?.copyWith(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                  color: colors.brandNavy,
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctor.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.labelMedium?.copyWith(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: colors.brandNavy,
                    ),
                  ),
                  SizedBox(height: 3.h),
                  Text(
                    '${doctor.specialty} · ${doctor.yearsExperience} ${s.yearsExpSuffix}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.bodySmall?.copyWith(
                      fontSize: 12.sp,
                      color: colors.secondaryText,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    children: [
                      Text(
                        doctor.availabilityStatus,
                        style: textTheme.labelSmall?.copyWith(
                          fontSize: 11.5.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.successGreen,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.w),
                        child: Text(
                          '·',
                          style: textTheme.labelSmall?.copyWith(
                            color: colors.secondaryText,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.star_rounded,
                        size: 14.sp,
                        color: AppColors.warningAmber,
                      ),
                      SizedBox(width: 2.w),
                      Text(
                        doctor.rating.toStringAsFixed(1),
                        style: textTheme.labelSmall?.copyWith(
                          fontSize: 11.5.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.warningAmber,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: 8.w),
            Icon(
              context.forwardChevron,
              size: 22.sp,
              color: colors.secondaryText,
            ),
          ],
        ),
      ),
    );
  }
}
