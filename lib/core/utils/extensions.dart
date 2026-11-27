import 'package:flutter/material.dart';
import 'package:haya_care/core/constants/app_assets.dart';
import 'package:haya_care/core/theme/app_theme.dart';

extension ContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  AppThemeColors get appColors => Theme.of(this).extension<AppThemeColors>()!;

  double get screenWidth => MediaQuery.sizeOf(this).width;
  double get screenHeight => MediaQuery.sizeOf(this).height;

  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
  bool get isRtl => Directionality.of(this) == TextDirection.rtl;
  IconData get backChevron =>
      isRtl ? Icons.chevron_right_rounded : Icons.chevron_left_rounded;
  IconData get forwardChevron =>
      isRtl ? Icons.chevron_left_rounded : Icons.chevron_right_rounded;
  String get googleLogoAsset =>
      isDarkMode ? AppAssets.googleDarkLogo : AppAssets.googleLightLogo;

  void pushNamed(String routeName, {Object? arguments}) {
    Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  void pushReplacementNamed(String routeName, {Object? arguments}) {
    Navigator.of(this).pushReplacementNamed(routeName, arguments: arguments);
  }

  void pop<T extends Object?>([T? result]) {
    Navigator.of(this).pop<T>(result);
  }
}
