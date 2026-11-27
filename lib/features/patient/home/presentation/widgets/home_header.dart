import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class HomeHeader extends StatelessWidget {
  final VoidCallback? onMessagesTap;
  final VoidCallback? onNotificationTap;
  final VoidCallback? onProfileTap;

  const HomeHeader({
    super.key,
    this.onMessagesTap,
    this.onNotificationTap,
    this.onProfileTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colors = context.appColors;
    final s = S.of(context)!;

    return SizedBox(
      height: 40.r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.favorite_border_rounded, color: AppColors.orangeBadge, size: 20.sp),
              SizedBox(width: 6.w),
              RichText(
                text: TextSpan(
                  style: textTheme.headlineMedium?.copyWith(fontSize: 18.sp, fontWeight: FontWeight.bold, color: colors.primaryText),
                  children: [
                    const TextSpan(text: 'Haya'),
                    TextSpan(text: 'Care', style: textTheme.headlineMedium?.copyWith(fontSize: 18.sp, fontWeight: FontWeight.bold, color: AppColors.orangeBadge)),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _HeaderBadgeButton(icon: Icons.mail_outline_rounded, badgeCount: '2', onTap: onMessagesTap),
              SizedBox(width: 8.w),
              _HeaderBadgeButton(icon: Icons.notifications_none_rounded, badgeCount: '2', onTap: onNotificationTap),
              SizedBox(width: 8.w),
              GestureDetector(
                onTap: onProfileTap,
                child: Container(
                  width: 38.r,
                  height: 38.r,
                  decoration: BoxDecoration(color: colors.orangeSurface, shape: BoxShape.circle),
                  alignment: Alignment.center,
                  child: Text(s.defaultUserInitials, style: textTheme.labelMedium?.copyWith(fontSize: 12.5.sp, fontWeight: FontWeight.bold, color: AppColors.orangeBadge)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _HeaderBadgeButton extends StatelessWidget {
  final IconData icon;
  final String badgeCount;
  final VoidCallback? onTap;

  const _HeaderBadgeButton({
    required this.icon,
    required this.badgeCount,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final textTheme = context.textTheme;
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 38.r,
            height: 38.r,
            decoration: BoxDecoration(
              color: context.theme.cardTheme.color,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: const [BoxShadow(color: AppColors.shadowColor, blurRadius: 10, offset: Offset(0, 2))],
            ),
            alignment: Alignment.center,
            child: Icon(icon, color: colors.primaryText, size: 19.sp),
          ),
          PositionedDirectional(
            top: -4.h,
            end: -4.w,
            child: Container(
              width: 16.r,
              height: 16.r,
              decoration: const BoxDecoration(color: AppColors.orangeBadge, shape: BoxShape.circle),
              alignment: Alignment.center,
              child: Text(badgeCount, style: textTheme.labelSmall?.copyWith(fontSize: 9.sp, fontWeight: FontWeight.bold, color: AppColors.white, height: 1)),
            ),
          ),
        ],
      ),
    );
  }
}
