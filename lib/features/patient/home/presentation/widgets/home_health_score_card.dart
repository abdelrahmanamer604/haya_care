import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class HomeHealthScoreCard extends StatelessWidget {
  final int score;
  final int maxScore;

  const HomeHealthScoreCard({
    super.key,
    this.score = 86,
    this.maxScore = 100,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final textTheme = context.textTheme;
    final colors = context.appColors;
    final progress = score / maxScore;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        borderRadius: BorderRadius.circular(22.r),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: 14,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 3.h,
                  ),
                  decoration: BoxDecoration(
                    color: colors.navySurface,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Text(
                    s.healthScoreToday,
                    style: textTheme.titleSmall?.copyWith(
                      color: colors.brandNavy,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                SizedBox(height: 6.h),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      '$score',
                      style: textTheme.headlineMedium?.copyWith(
                        fontSize: 34.sp,
                        fontWeight: FontWeight.bold,
                        color: colors.brandNavy,
                        height: 1.1,
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 6.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        color: colors.navySurface,
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Text(
                        '/ $maxScore',
                        style: textTheme.titleSmall?.copyWith(
                          color: colors.brandNavy,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6.h),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 3.h,
                  ),
                  decoration: BoxDecoration(
                    color: colors.navySurface,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Text(
                    s.healthScoreStable,
                    style: textTheme.titleSmall?.copyWith(
                      color: colors.brandNavy,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 14.w),
          SizedBox(
            width: 68.r,
            height: 68.r,
            child: CircularProgressIndicator(
              value: progress,
              strokeWidth: 7.5,
              strokeCap: StrokeCap.round,
              backgroundColor: colors.borderColor,
              color: AppColors.successGreen,
            ),
          ),

        ],
      ),
    );
  }
}
