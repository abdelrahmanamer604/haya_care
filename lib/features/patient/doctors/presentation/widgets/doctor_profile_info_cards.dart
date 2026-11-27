import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/features/patient/doctors/data/models/doctor_model.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class DoctorProfileInfoCards extends StatelessWidget {
  final DoctorModel doctor;

  const DoctorProfileInfoCards({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final colors = context.appColors;
    final textTheme = context.textTheme;

    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(18.r),
          decoration: BoxDecoration(
            color: colors.cardBackground,
            borderRadius: BorderRadius.circular(22.r),
            boxShadow: const [
              BoxShadow(
                color: AppColors.shadowColor,
                blurRadius: 14,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                s.aboutDoctorTitle,
                style: textTheme.titleMedium?.copyWith(
                  fontSize: 15.5.sp,
                  fontWeight: FontWeight.bold,
                  color: colors.brandNavy,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                doctor.bio,
                style: textTheme.bodySmall?.copyWith(
                  fontSize: 13.sp,
                  color: colors.secondaryText,
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 14.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(18.r),
          decoration: BoxDecoration(
            color: colors.cardBackground,
            borderRadius: BorderRadius.circular(22.r),
            boxShadow: const [
              BoxShadow(
                color: AppColors.shadowColor,
                blurRadius: 14,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                s.availabilityTitle,
                style: textTheme.titleMedium?.copyWith(
                  fontSize: 15.5.sp,
                  fontWeight: FontWeight.bold,
                  color: colors.brandNavy,
                ),
              ),
              SizedBox(height: 10.h),
              for (int i = 0; i < doctor.slots.length; i++) ...[
                if (i > 0) Divider(color: colors.borderColor, height: 18.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      doctor.slots[i].day,
                      style: textTheme.bodySmall?.copyWith(
                        fontSize: 13.sp,
                        color: colors.secondaryText,
                      ),
                    ),
                    Text(
                      doctor.slots[i].time,
                      style: textTheme.labelMedium?.copyWith(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                        color: colors.brandNavy,
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
