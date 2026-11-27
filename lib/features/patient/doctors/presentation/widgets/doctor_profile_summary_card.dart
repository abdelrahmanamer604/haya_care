import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/features/patient/doctors/data/models/doctor_model.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class DoctorProfileSummaryCard extends StatelessWidget {
  final DoctorModel doctor;

  const DoctorProfileSummaryCard({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final colors = context.appColors;
    final textTheme = context.textTheme;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
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
        children: [
          Container(
            width: 78.r,
            height: 78.r,
            decoration: BoxDecoration(
              color: colors.navySurface,
              borderRadius: BorderRadius.circular(22.r),
            ),
            alignment: Alignment.center,
            child: Text(
              doctor.initials,
              style: textTheme.headlineMedium?.copyWith(
                fontSize: 26.sp,
                fontWeight: FontWeight.bold,
                color: colors.brandNavy,
              ),
            ),
          ),
          SizedBox(height: 14.h),
          Text(
            doctor.name,
            textAlign: TextAlign.center,
            style: textTheme.headlineMedium?.copyWith(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: colors.brandNavy,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            doctor.specialtyTitle,
            textAlign: TextAlign.center,
            style: textTheme.bodySmall?.copyWith(
              fontSize: 13.sp,
              color: colors.secondaryText,
            ),
          ),
          SizedBox(height: 16.h),
          Divider(color: colors.borderColor, height: 1),
          SizedBox(height: 16.h),
          Row(
            children: [
              _StatItem(
                value: doctor.rating.toStringAsFixed(1),
                label: s.ratingLabel,
                textTheme: textTheme,
                colors: colors,
              ),
              _verticalDivider(colors),
              _StatItem(
                value: '${doctor.yearsExperience}',
                label: s.yearsExpShort,
                textTheme: textTheme,
                colors: colors,
              ),
              _verticalDivider(colors),
              _StatItem(
                value: doctor.patientsCount,
                label: s.patientsLabel,
                textTheme: textTheme,
                colors: colors,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _verticalDivider(dynamic colors) => Container(
        width: 1,
        height: 30.h,
        color: colors.borderColor as Color,
      );
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;
  final TextTheme textTheme;
  final dynamic colors;

  const _StatItem({
    required this.value,
    required this.label,
    required this.textTheme,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: textTheme.titleMedium?.copyWith(
              fontSize: 17.sp,
              fontWeight: FontWeight.bold,
              color: colors.brandNavy as Color,
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            label,
            style: textTheme.labelSmall?.copyWith(
              fontSize: 11.sp,
              color: colors.secondaryText as Color,
            ),
          ),
        ],
      ),
    );
  }
}
