import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/app_state.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/features/patient/profile/presentation/widgets/main/profile_preferences_toggles.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class ProfilePreferencesCard extends StatelessWidget {
  final bool remindersEnabled;
  final ValueChanged<bool> onRemindersChanged;

  const ProfilePreferencesCard({
    super.key,
    required this.remindersEnabled,
    required this.onRemindersChanged,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final colors = context.appColors;
    final textTheme = context.textTheme;
    final dividerColor = colors.borderColor.withValues(alpha: 0.5);

    return Container(
      padding: EdgeInsets.all(18.r),
      decoration: BoxDecoration(
        color: colors.cardBackground,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: const [BoxShadow(color: AppColors.shadowColor, blurRadius: 12, offset: Offset(0, 3))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(s.preferencesTitle, style: textTheme.titleMedium?.copyWith(fontSize: 16.sp, fontWeight: FontWeight.bold, color: colors.brandNavy)),
          SizedBox(height: 14.h),
          const ProfilePreferencesToggles(),
          SizedBox(height: 14.h),
          Divider(height: 1, color: dividerColor),
          SizedBox(height: 12.h),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(s.measurementUnitsTitle, style: textTheme.labelMedium?.copyWith(fontSize: 13.sp, fontWeight: FontWeight.w600, color: colors.secondaryText)),
            Text(s.measurementUnitsValue, style: textTheme.labelMedium?.copyWith(fontSize: 12.5.sp, fontWeight: FontWeight.bold, color: colors.brandNavy)),
          ]),
          SizedBox(height: 12.h),
          Divider(height: 1, color: dividerColor),
          SizedBox(height: 10.h),
          _PrefSwitchRow(title: s.remindersTitle, subtitle: s.remindersSubtitle, value: remindersEnabled, onChanged: onRemindersChanged),
          SizedBox(height: 6.h),
          ValueListenableBuilder<bool>(
            valueListenable: AppState.largeTextMode,
            builder: (_, val, _) => _PrefSwitchRow(title: s.largeTextModeTitle, subtitle: s.largeTextModeSubtitle, value: val, onChanged: AppState.setLargeTextMode),
          ),
          SizedBox(height: 6.h),
          ValueListenableBuilder<bool>(
            valueListenable: AppState.ramadanMode,
            builder: (_, val, _) => _PrefSwitchRow(title: s.ramadanModeTitle, subtitle: s.ramadanModeSubtitle, value: val, onChanged: AppState.setRamadanMode),
          ),
        ],
      ),
    );
  }
}

class _PrefSwitchRow extends StatelessWidget {
  final String title, subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;
  const _PrefSwitchRow({required this.title, required this.subtitle, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final textTheme = context.textTheme;
    return Row(children: [
      Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: textTheme.labelMedium?.copyWith(fontSize: 13.sp, fontWeight: FontWeight.bold, color: colors.brandNavy)),
          SizedBox(height: 2.h),
          Text(subtitle, style: textTheme.labelSmall?.copyWith(fontSize: 10.5.sp, color: colors.secondaryText)),
        ]),
      ),
      Switch(value: value, activeThumbColor: AppColors.white, activeTrackColor: AppColors.successGreen, onChanged: onChanged),
    ]);
  }
}
