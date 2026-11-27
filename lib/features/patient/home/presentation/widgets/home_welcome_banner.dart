import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class HomeWelcomeBanner extends StatelessWidget {
  final int healthScore;
  final int streakDays;

  const HomeWelcomeBanner({
    super.key,
    this.healthScore = 92,
    this.streakDays = 7,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final textTheme = context.textTheme;

    return Container(
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.splashBackground, AppColors.splashGradientEnd],
          begin: AlignmentDirectional.topStart,
          end: AlignmentDirectional.bottomEnd,
        ),
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(color: AppColors.splashBackground.withValues(alpha: 0.25), blurRadius: 18, offset: const Offset(0, 8)),
        ],
      ),
      child: Stack(
        children: [
          PositionedDirectional(
            end: -24.w,
            bottom: -36.h,
            child: Container(
              width: 130.r,
              height: 130.r,
              decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.white.withValues(alpha: 0.05)),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(s.goodMorning, style: textTheme.bodySmall?.copyWith(fontSize: 12.sp, color: AppColors.splashSubtitleText)),
                SizedBox(height: 4.h),
                Text(
                  s.welcomeUser(s.defaultUserName.split(' ').first),
                  style: textTheme.headlineMedium?.copyWith(fontSize: 24.sp, fontWeight: FontWeight.bold, color: AppColors.white, height: 1.2),
                ),
                SizedBox(height: 6.h),
                Text(s.welcomeTagline, style: textTheme.bodySmall?.copyWith(fontSize: 12.sp, color: AppColors.splashSubtitleText)),
                SizedBox(height: 14.h),
                Wrap(
                  spacing: 8.w,
                  runSpacing: 6.h,
                  children: [
                    _BannerPill(icon: Icons.verified_outlined, label: '${s.healthScoreLabel}: $healthScore%'),
                    _BannerPill(icon: Icons.local_fire_department_outlined, label: s.streakDaysLabel(streakDays)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BannerPill extends StatelessWidget {
  final IconData icon;
  final String label;
  const _BannerPill({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: AppColors.white.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: AppColors.orangeBadge, size: 14.sp),
          SizedBox(width: 5.w),
          Text(label, style: context.textTheme.labelSmall?.copyWith(fontSize: 11.sp, fontWeight: FontWeight.bold, color: AppColors.white)),
        ],
      ),
    );
  }
}
