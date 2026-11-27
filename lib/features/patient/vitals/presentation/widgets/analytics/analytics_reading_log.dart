import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class AnalyticsReadingLog extends StatelessWidget {
  final VoidCallback onViewAll;

  const AnalyticsReadingLog({super.key, required this.onViewAll});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final theme = context.theme;
    final textTheme = context.textTheme;
    final colors = context.appColors;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              s.readingsLogTitle,
              style: textTheme.labelMedium?.copyWith(
                fontSize: 17.sp,
                fontWeight: FontWeight.bold,
                color: colors.brandNavy,
              ),
            ),
            GestureDetector(
              onTap: onViewAll,
              child: Text(
                s.viewAll,
                style: textTheme.titleSmall?.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.orangeBadge,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
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
                width: 38.r,
                height: 38.r,
                decoration: BoxDecoration(
                  color: colors.orangeSurface,
                  borderRadius: BorderRadius.circular(11.r),
                ),
                alignment: Alignment.center,
                child: Icon(
                  Icons.monitor_heart_outlined,
                  color: AppColors.orangeBadge,
                  size: 19.sp,
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      '128/82',
                      style: textTheme.labelMedium?.copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: colors.brandNavy,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Flexible(
                      child: Text(
                        s.todayTime830,
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
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                decoration: BoxDecoration(
                  color: colors.greenSurface,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      s.normalStatus,
                      style: textTheme.labelSmall?.copyWith(
                        fontSize: 10.5.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.successGreen,
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Container(
                      width: 6.r,
                      height: 6.r,
                      decoration: const BoxDecoration(
                        color: AppColors.successGreen,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
