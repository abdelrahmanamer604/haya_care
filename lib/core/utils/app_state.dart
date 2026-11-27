import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppState {
  AppState._();

  static const String _themeKey = 'app_theme_mode';
  static const String _localeKey = 'app_locale_code';
  static const String _largeTextKey = 'app_large_text';
  static const String _ramadanKey = 'app_ramadan_mode';

  static final ValueNotifier<ThemeMode> themeMode =
      ValueNotifier<ThemeMode>(ThemeMode.light);
  static final ValueNotifier<Locale> locale =
      ValueNotifier<Locale>(const Locale('ar'));
  static final ValueNotifier<bool> largeTextMode = ValueNotifier<bool>(false);
  static final ValueNotifier<bool> ramadanMode = ValueNotifier<bool>(false);

  static Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    final savedTheme = prefs.getString(_themeKey);
    if (savedTheme != null) {
      themeMode.value = ThemeMode.values.firstWhere(
        (m) => m.name == savedTheme,
        orElse: () => ThemeMode.light,
      );
    }
    final savedLocale = prefs.getString(_localeKey);
    if (savedLocale == 'ar' || savedLocale == 'en') {
      locale.value = Locale(savedLocale!);
    }
    largeTextMode.value = prefs.getBool(_largeTextKey) ?? false;
    ramadanMode.value = prefs.getBool(_ramadanKey) ?? false;
  }

  static void setThemeMode(ThemeMode mode) {
    themeMode.value = mode;
    SharedPreferences.getInstance().then((p) => p.setString(_themeKey, mode.name));
  }

  static void toggleTheme() {
    setThemeMode(themeMode.value == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark);
  }

  static void setLocale(Locale newLocale) {
    locale.value = newLocale;
    SharedPreferences.getInstance().then((p) => p.setString(_localeKey, newLocale.languageCode));
  }

  static void toggleLocale() {
    setLocale(locale.value.languageCode == 'ar' ? const Locale('en') : const Locale('ar'));
  }

  static void setLargeTextMode(bool enabled) {
    largeTextMode.value = enabled;
    SharedPreferences.getInstance().then((p) => p.setBool(_largeTextKey, enabled));
  }

  static void setRamadanMode(bool enabled) {
    ramadanMode.value = enabled;
    SharedPreferences.getInstance().then((p) => p.setBool(_ramadanKey, enabled));
  }
}
