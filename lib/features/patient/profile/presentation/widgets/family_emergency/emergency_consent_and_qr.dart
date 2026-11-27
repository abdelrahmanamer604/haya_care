import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class EmergencyConsentCard extends StatelessWidget {
  final bool consentEnabled;
  final ValueChanged<bool> onChanged;

  const EmergencyConsentCard({super.key, required this.consentEnabled, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final colors = context.appColors;
    final textTheme = context.textTheme;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: colors.cardBackground,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: const [BoxShadow(color: AppColors.shadowColor, blurRadius: 10, offset: Offset(0, 3))],
      ),
      child: Row(children: [
        Container(
          width: 40.r,
          height: 40.r,
          decoration: BoxDecoration(color: colors.orangeSurface, borderRadius: BorderRadius.circular(12.r)),
          alignment: Alignment.center,
          child: Icon(Icons.lock_outline_rounded, color: AppColors.orangeBadge, size: 20.sp),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(s.consentShareCardTitle, style: textTheme.labelMedium?.copyWith(fontSize: 12.5.sp, fontWeight: FontWeight.bold, color: colors.brandNavy)),
            SizedBox(height: 2.h),
            Text(s.consentShareCardSubtitle, style: textTheme.labelSmall?.copyWith(fontSize: 10.sp, color: colors.secondaryText)),
          ]),
        ),
        Switch(value: consentEnabled, activeThumbColor: AppColors.white, activeTrackColor: AppColors.successGreen, onChanged: onChanged),
      ]),
    );
  }
}

class EmergencyQrBanner extends StatelessWidget {
  final String secretToken;
  final VoidCallback onEnlargeTap;
  final VoidCallback onRegenerateTap;

  const EmergencyQrBanner({
    super.key,
    required this.secretToken,
    required this.onEnlargeTap,
    required this.onRegenerateTap,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final textTheme = context.textTheme;
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.splashBackground,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: const [BoxShadow(color: AppColors.shadowColor, blurRadius: 12, offset: Offset(0, 4))],
      ),
      child: Column(
        children: [
          Row(children: [
            Icon(Icons.favorite_border_rounded, color: AppColors.white, size: 26.sp),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('${s.emergencyQrTitle} · $secretToken', style: textTheme.titleSmall?.copyWith(fontSize: 13.5.sp, fontWeight: FontWeight.bold, color: AppColors.white)),
                SizedBox(height: 2.h),
                Text(s.emergencyQrSubtitle, style: textTheme.labelSmall?.copyWith(fontSize: 10.sp, color: AppColors.splashSubtitleText)),
              ]),
            ),
            SizedBox(width: 8.w),
            InkWell(
              onTap: onEnlargeTap,
              borderRadius: BorderRadius.circular(10.r),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 7.h),
                decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(10.r)),
                child: Text(s.enlargeQrButton, style: textTheme.labelSmall?.copyWith(fontSize: 11.sp, fontWeight: FontWeight.bold, color: AppColors.splashBackground)),
              ),
            ),
          ]),
          SizedBox(height: 10.h),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: InkWell(
              onTap: onRegenerateTap,
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                Icon(Icons.refresh_rounded, color: AppColors.orangeBadge, size: 14.sp),
                SizedBox(width: 4.w),
                Text(s.regenerateLinkButton, style: textTheme.labelSmall?.copyWith(fontSize: 11.sp, fontWeight: FontWeight.bold, color: AppColors.orangeBadge)),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
