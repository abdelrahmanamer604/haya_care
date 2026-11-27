import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class ProfileUserBanner extends StatelessWidget {
  final String name;
  final String email;
  final String initials;
  final VoidCallback? onEditTap;

  const ProfileUserBanner({
    super.key,
    required this.name,
    required this.email,
    required this.initials,
    this.onEditTap,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final textTheme = context.textTheme;

    return Container(
      padding: EdgeInsets.all(18.r),
      decoration: BoxDecoration(
        color: AppColors.splashBackground,
        borderRadius: BorderRadius.circular(22.r),
        boxShadow: const [
          BoxShadow(color: AppColors.shadowColor, blurRadius: 14, offset: Offset(0, 4)),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 58.r,
            height: 58.r,
            decoration: BoxDecoration(color: AppColors.onboardingPeach, borderRadius: BorderRadius.circular(16.r)),
            alignment: Alignment.center,
            child: Text(initials, style: textTheme.titleLarge?.copyWith(fontSize: 19.sp, fontWeight: FontWeight.bold, color: AppColors.splashBackground)),
          ),
          SizedBox(width: 14.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: textTheme.titleMedium?.copyWith(fontSize: 17.sp, fontWeight: FontWeight.bold, color: AppColors.white)),
                SizedBox(height: 2.h),
                Text(email, style: textTheme.bodySmall?.copyWith(fontSize: 11.5.sp, color: AppColors.splashSubtitleText)),
                SizedBox(height: 6.h),
                GestureDetector(
                  onTap: onEditTap,
                  child: Text(s.editPersonalInfo, style: textTheme.labelMedium?.copyWith(fontSize: 11.5.sp, fontWeight: FontWeight.bold, color: AppColors.orangeBadge)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
