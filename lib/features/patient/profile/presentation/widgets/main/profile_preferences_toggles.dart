import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/utils/app_state.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/core/widgets/app_segmented_toggle.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class ProfilePreferencesToggles extends StatelessWidget {
  const ProfilePreferencesToggles({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final colors = context.appColors;
    final textTheme = context.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          s.languageTitle,
          style: textTheme.labelMedium?.copyWith(
            fontSize: 13.sp,
            fontWeight: FontWeight.bold,
            color: colors.brandNavy,
          ),
        ),
        SizedBox(height: 2.h),
        Text(
          s.languageDirectionSubtitle,
          style: textTheme.labelSmall?.copyWith(
            fontSize: 10.5.sp,
            color: colors.secondaryText,
          ),
        ),
        SizedBox(height: 10.h),
        ValueListenableBuilder<Locale>(
          valueListenable: AppState.locale,
          builder: (context, locale, _) => AppSegmentedToggle<String>(
            height: 40.h,
            borderRadius: 12.0,
            fontSize: 12.0,
            selectedValue: locale.languageCode,
            onChanged: (code) => AppState.setLocale(Locale(code)),
            options: [
              AppToggleOption<String>(value: 'ar', label: s.arabic),
              AppToggleOption<String>(value: 'en', label: s.english),
            ],
          ),
        ),
        SizedBox(height: 14.h),
        Text(
          s.themeTitle,
          style: textTheme.labelMedium?.copyWith(
            fontSize: 13.sp,
            fontWeight: FontWeight.bold,
            color: colors.brandNavy,
          ),
        ),
        SizedBox(height: 8.h),
        ValueListenableBuilder<ThemeMode>(
          valueListenable: AppState.themeMode,
          builder: (context, mode, _) => AppSegmentedToggle<ThemeMode>(
            height: 40.h,
            borderRadius: 12.0,
            fontSize: 12.0,
            selectedValue: mode,
            onChanged: AppState.setThemeMode,
            options: [
              AppToggleOption<ThemeMode>(
                  value: ThemeMode.light, label: s.lightTheme),
              AppToggleOption<ThemeMode>(
                  value: ThemeMode.dark, label: s.darkTheme),
              AppToggleOption<ThemeMode>(
                  value: ThemeMode.system, label: s.systemTheme),
            ],
          ),
        ),
      ],
    );
  }
}
