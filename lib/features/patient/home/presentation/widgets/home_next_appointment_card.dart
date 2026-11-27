import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/core/widgets/tap_scale_widget.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class HomeNextAppointmentCard extends StatelessWidget {
  final VoidCallback? onTap;

  const HomeNextAppointmentCard({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final theme = context.theme;
    final textTheme = context.textTheme;
    final colors = context.appColors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  s.nextAppointmentTitle,
                  style: textTheme.labelMedium
                      ?.copyWith(fontSize: 17.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 2.h),
                Text(
                  s.nextConsultation,
                  style: textTheme.labelSmall?.copyWith(fontSize: 11.sp),
                ),
              ],
            ),
            Container(
              width: 36.r,
              height: 36.r,
              decoration: BoxDecoration(
                color: colors.orangeSurface,
                borderRadius: BorderRadius.circular(11.r),
              ),
              alignment: Alignment.center,
              child: Icon(Icons.calendar_today_outlined,
                  color: AppColors.orangeBadge, size: 18.sp),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        TapScaleWidget(
          onTap: onTap,
          scale: 1.02,
          child: Container(
            padding: EdgeInsets.all(14.r),
            decoration: BoxDecoration(
              color: theme.cardTheme.color,
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: const [
                BoxShadow(
                    color: AppColors.shadowColor, blurRadius: 12, offset: Offset(0, 4)),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 64.r,
                  height: 68.r,
                  decoration: BoxDecoration(
                    color: colors.navySurface,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  alignment: Alignment.center,
                  child: Icon(Icons.person_rounded,
                      size: 34.sp, color: colors.brandNavy),
                ),
                SizedBox(width: 14.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        s.familyMedicine,
                        style: textTheme.titleSmall?.copyWith(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.orangeBadge,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        s.demoDoctorName,
                        style: textTheme.labelMedium?.copyWith(
                            fontSize: 15.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                          Icon(Icons.calendar_today_outlined,
                              size: 12.sp, color: colors.secondaryText),
                          SizedBox(width: 5.w),
                          Expanded(
                            child: Text(
                              s.demoAppointmentTime,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: textTheme.labelSmall
                                  ?.copyWith(fontSize: 11.sp),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 6.h),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            s.viewDetails,
                            style: textTheme.titleSmall?.copyWith(
                              fontSize: 11.5.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.orangeBadge,
                            ),
                          ),
                          SizedBox(width: 2.w),
                          Icon(
                            context.forwardChevron,
                            size: 16.sp,
                            color: AppColors.orangeBadge,
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
      ],
    );
  }
}
