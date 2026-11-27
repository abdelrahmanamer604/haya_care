import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/core/widgets/tap_scale_widget.dart';
import 'package:haya_care/features/patient/doctors/data/models/doctor_model.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class DoctorChatHeader extends StatelessWidget {
  final DoctorModel doctor;
  final VoidCallback onBack;

  const DoctorChatHeader({
    super.key,
    required this.doctor,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final textTheme = context.textTheme;
    final colors = context.appColors;

    return Container(
      width: double.infinity,
      color: AppColors.splashBackground,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          child: Row(
            children: [
              TapScaleWidget(
                scale: 0.94,
                onTap: onBack,
                child: Container(
                  width: 40.r,
                  height: 40.r,
                  decoration: BoxDecoration(
                    color: AppColors.white.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    context.backChevron,
                    color: AppColors.white,
                    size: 22.sp,
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Container(
                width: 44.r,
                height: 44.r,
                decoration: BoxDecoration(
                  color: colors.navySurface,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  doctor.initials,
                  style: textTheme.titleSmall?.copyWith(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: colors.brandNavy,
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      doctor.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.titleMedium?.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      children: [
                        Container(
                          width: 7.r,
                          height: 7.r,
                          decoration: const BoxDecoration(
                            color: AppColors.successGreen,
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 6.w),
                        Text(
                          s.onlineNow,
                          style: textTheme.labelSmall?.copyWith(
                            fontSize: 11.5.sp,
                            color: AppColors.splashSubtitleText,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
