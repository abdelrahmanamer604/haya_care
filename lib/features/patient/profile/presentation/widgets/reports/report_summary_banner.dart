import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class ReportSummaryBanner extends StatelessWidget {
  final String title;
  final String dateRange;

  const ReportSummaryBanner({
    super.key,
    required this.title,
    required this.dateRange,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final textTheme = context.textTheme;

    return Container(
      padding: EdgeInsets.all(18.r),
      decoration: BoxDecoration(
        color: AppColors.splashBackground,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 44.r,
            height: 44.r,
            decoration: BoxDecoration(
              color: AppColors.white.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(14.r),
            ),
            alignment: Alignment.center,
            child: Icon(
              Icons.description_outlined,
              color: AppColors.white,
              size: 22.sp,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  s.healthSummaryLabel,
                  style: textTheme.labelSmall?.copyWith(
                    fontSize: 10.5.sp,
                    color: AppColors.splashSubtitleText,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  title,
                  style: textTheme.titleMedium?.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  dateRange,
                  style: textTheme.labelSmall?.copyWith(
                    fontSize: 10.5.sp,
                    color: AppColors.splashSubtitleText,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.favorite_border_rounded,
                color: AppColors.orangeBadge,
                size: 16.sp,
              ),
              SizedBox(width: 4.w),
              RichText(
                text: TextSpan(
                  style: textTheme.labelMedium?.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                  children: [
                    const TextSpan(text: 'Haya'),
                    TextSpan(
                      text: 'Care',
                      style: textTheme.labelMedium?.copyWith(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.orangeBadge,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
