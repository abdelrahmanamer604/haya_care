import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class ProfilePrivacyCard extends StatelessWidget {
  final bool shareHealthData;
  final bool assistantAccess;
  final ValueChanged<bool> onShareHealthChanged;
  final ValueChanged<bool> onAssistantAccessChanged;

  const ProfilePrivacyCard({
    super.key,
    required this.shareHealthData,
    required this.assistantAccess,
    required this.onShareHealthChanged,
    required this.onAssistantAccessChanged,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final colors = context.appColors;
    final textTheme = context.textTheme;

    return Container(
      padding: EdgeInsets.all(18.r),
      decoration: BoxDecoration(
        color: colors.cardBackground,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: 12,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            s.privacyAndControlTitle,
            style: textTheme.titleMedium?.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: colors.brandNavy,
            ),
          ),
          SizedBox(height: 12.h),
          _PrivacyToggleRow(
            title: s.shareHealthDataTitle,
            subtitle: s.shareHealthDataSubtitle,
            value: shareHealthData,
            onChanged: onShareHealthChanged,
          ),
          SizedBox(height: 10.h),
          _PrivacyToggleRow(
            title: s.healthAssistantAccessTitle,
            subtitle: s.healthAssistantAccessSubtitle,
            value: assistantAccess,
            onChanged: onAssistantAccessChanged,
          ),
          SizedBox(height: 12.h),
          Divider(height: 1, color: colors.borderColor.withValues(alpha: 0.5)),
          SizedBox(height: 10.h),
          Row(
            children: [
              Icon(
                Icons.lock_outline_rounded,
                size: 15.sp,
                color: colors.secondaryText,
              ),
              SizedBox(width: 6.w),
              Expanded(
                child: Text(
                  s.privacyDefaultNote,
                  style: textTheme.labelSmall?.copyWith(
                    fontSize: 10.5.sp,
                    color: colors.secondaryText,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PrivacyToggleRow extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _PrivacyToggleRow({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final textTheme = context.textTheme;

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: textTheme.labelMedium?.copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                  color: colors.brandNavy,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                subtitle,
                style: textTheme.labelSmall?.copyWith(
                  fontSize: 10.5.sp,
                  color: colors.secondaryText,
                ),
              ),
            ],
          ),
        ),
        Switch(
          value: value,
          activeThumbColor: AppColors.white,
          activeTrackColor: AppColors.successGreen,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
