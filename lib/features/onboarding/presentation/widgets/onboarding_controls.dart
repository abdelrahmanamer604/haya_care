import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/app_state.dart';
import 'package:haya_care/core/widgets/app_segmented_toggle.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class OnboardingControls extends StatelessWidget {
  const OnboardingControls({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildCard(
            context,
            icon: Icons.language_rounded,
            title: s.appLanguage,
            subtitle: s.appLanguageSubtitle,
            child: ValueListenableBuilder<Locale>(
              valueListenable: AppState.locale,
              builder: (context, locale, _) {
                return AppSegmentedToggle<String>(
                  height: 42.h,
                  borderRadius: 12.0,
                  fontSize: 12.0,
                  selectedValue: locale.languageCode,
                  onChanged: (langCode) {
                    if (locale.languageCode != langCode) {
                      AppState.toggleLocale();
                    }
                  },
                  options: [
                    AppToggleOption<String>(
                      value: 'ar',
                      label: s.arabic,
                    ),
                    AppToggleOption<String>(
                      value: 'en',
                      label: s.english,
                    ),
                  ],
                );
              },
            ),
          ),
          SizedBox(height: 12.h),
          _buildCard(
            context,
            icon: Icons.palette_outlined,
            title: s.appTheme,
            subtitle: s.appThemeSubtitle,
            child: ValueListenableBuilder<ThemeMode>(
              valueListenable: AppState.themeMode,
              builder: (context, themeMode, _) {
                return AppSegmentedToggle<ThemeMode>(
                  height: 42.h,
                  borderRadius: 12.0,
                  fontSize: 12.0,
                  selectedValue: themeMode,
                  onChanged: AppState.setThemeMode,
                  options: [
                    AppToggleOption<ThemeMode>(
                      value: ThemeMode.light,
                      label: s.lightTheme,
                    ),
                    AppToggleOption<ThemeMode>(
                      value: ThemeMode.dark,
                      label: s.darkTheme,
                    ),
                    AppToggleOption<ThemeMode>(
                      value: ThemeMode.system,
                      label: s.systemTheme,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Widget child,
  }) {
    return Container(
      padding: EdgeInsets.all(14.r),
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: AppColors.orangeBadge, size: 20.sp),
              SizedBox(width: 8.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          fontSize: 10.sp,
                        ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10.h),
          child,
        ],
      ),
    );
  }
}
