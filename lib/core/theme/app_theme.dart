import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haya_care/core/theme/app_colors.dart';

@immutable
class AppThemeColors extends ThemeExtension<AppThemeColors> {
  final Color primaryText;
  final Color secondaryText;
  final Color brandNavy;
  final Color cardBackground;
  final Color inputBackground;
  final Color borderColor;
  final Color orangeSurface;
  final Color navySurface;
  final Color greenSurface;
  final Color redSurface;
  final Color warningSurface;
  final Color navBarGlassBg;
  final Color navBarGlassBorder;
  final Color navBarShadow;
  final Color uploadCardBackground;

  const AppThemeColors({
    required this.primaryText,
    required this.secondaryText,
    required this.brandNavy,
    required this.cardBackground,
    required this.inputBackground,
    required this.borderColor,
    required this.orangeSurface,
    required this.navySurface,
    required this.greenSurface,
    required this.redSurface,
    required this.warningSurface,
    required this.navBarGlassBg,
    required this.navBarGlassBorder,
    required this.navBarShadow,
    required this.uploadCardBackground,
  });

  static final light = AppThemeColors(
    primaryText: AppColors.darkText,
    secondaryText: AppColors.bodyText,
    brandNavy: AppColors.splashBackground,
    cardBackground: AppColors.cardBackground,
    inputBackground: AppColors.inputBackground,
    borderColor: AppColors.borderLight,
    orangeSurface: AppColors.orangeLight,
    navySurface: AppColors.sampleCardBg,
    greenSurface: AppColors.successGreenLight,
    redSurface: AppColors.heartRateRedLight,
    warningSurface: AppColors.warningAmberLight,
    navBarGlassBg: AppColors.white.withValues(alpha: 0.82),
    navBarGlassBorder: AppColors.white.withValues(alpha: 0.9),
    navBarShadow: AppColors.black.withValues(alpha: 0.08),
    uploadCardBackground: AppColors.uploadCardBg,
  );

  static final dark = AppThemeColors(
    primaryText: AppColors.darkSecondaryText,
    secondaryText: AppColors.darkSecondaryText,
    brandNavy: AppColors.darkPrimaryText,
    cardBackground: AppColors.darkCardBackground,
    inputBackground: AppColors.darkInputBackground,
    borderColor: AppColors.darkBorder,
    orangeSurface: AppColors.orangeBadge.withValues(alpha: 0.18),
    navySurface: AppColors.darkInputBackground,
    greenSurface: AppColors.successGreen.withValues(alpha: 0.18),
    redSurface: AppColors.heartRateRed.withValues(alpha: 0.18),
    warningSurface: AppColors.warningAmber.withValues(alpha: 0.18),
    navBarGlassBg: AppColors.darkCardBackground.withValues(alpha: 0.78),
    navBarGlassBorder: AppColors.darkBorder.withValues(alpha: 0.6),
    navBarShadow: AppColors.black.withValues(alpha: 0.35),
    uploadCardBackground: AppColors.darkInputBackground,
  );

  @override
  AppThemeColors copyWith({
    Color? primaryText,
    Color? secondaryText,
    Color? brandNavy,
    Color? cardBackground,
    Color? inputBackground,
    Color? borderColor,
    Color? orangeSurface,
    Color? navySurface,
    Color? greenSurface,
    Color? redSurface,
    Color? warningSurface,
    Color? navBarGlassBg,
    Color? navBarGlassBorder,
    Color? navBarShadow,
    Color? uploadCardBackground,
  }) {
    return AppThemeColors(
      primaryText: primaryText ?? this.primaryText,
      secondaryText: secondaryText ?? this.secondaryText,
      brandNavy: brandNavy ?? this.brandNavy,
      cardBackground: cardBackground ?? this.cardBackground,
      inputBackground: inputBackground ?? this.inputBackground,
      borderColor: borderColor ?? this.borderColor,
      orangeSurface: orangeSurface ?? this.orangeSurface,
      navySurface: navySurface ?? this.navySurface,
      greenSurface: greenSurface ?? this.greenSurface,
      redSurface: redSurface ?? this.redSurface,
      warningSurface: warningSurface ?? this.warningSurface,
      navBarGlassBg: navBarGlassBg ?? this.navBarGlassBg,
      navBarGlassBorder: navBarGlassBorder ?? this.navBarGlassBorder,
      navBarShadow: navBarShadow ?? this.navBarShadow,
      uploadCardBackground: uploadCardBackground ?? this.uploadCardBackground,
    );
  }

  @override
  AppThemeColors lerp(ThemeExtension<AppThemeColors>? other, double t) {
    if (other is! AppThemeColors) return this;
    return AppThemeColors(
      primaryText: Color.lerp(primaryText, other.primaryText, t)!,
      secondaryText: Color.lerp(secondaryText, other.secondaryText, t)!,
      brandNavy: Color.lerp(brandNavy, other.brandNavy, t)!,
      cardBackground: Color.lerp(cardBackground, other.cardBackground, t)!,
      inputBackground: Color.lerp(inputBackground, other.inputBackground, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
      orangeSurface: Color.lerp(orangeSurface, other.orangeSurface, t)!,
      navySurface: Color.lerp(navySurface, other.navySurface, t)!,
      greenSurface: Color.lerp(greenSurface, other.greenSurface, t)!,
      redSurface: Color.lerp(redSurface, other.redSurface, t)!,
      warningSurface: Color.lerp(warningSurface, other.warningSurface, t)!,
      navBarGlassBg: Color.lerp(navBarGlassBg, other.navBarGlassBg, t)!,
      navBarGlassBorder:
          Color.lerp(navBarGlassBorder, other.navBarGlassBorder, t)!,
      navBarShadow: Color.lerp(navBarShadow, other.navBarShadow, t)!,
      uploadCardBackground:
          Color.lerp(uploadCardBackground, other.uploadCardBackground, t)!,
    );
  }
}

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        scaffoldBackgroundColor: AppColors.scaffoldBackground,
        dividerColor: AppColors.borderLight,
        extensions: [AppThemeColors.light],
        cardTheme: CardThemeData(
          color: AppColors.cardBackground,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: AppColors.borderLight),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: AppColors.borderLight),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(
              color: AppColors.splashBackground,
              width: 1.5,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 13,
          ),
          hintStyle: const TextStyle(
            color: AppColors.bodyText,
            fontSize: 12,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryBlue,
            foregroundColor: Colors.white,
            elevation: 0,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        checkboxTheme: CheckboxThemeData(
          fillColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.primaryBlue;
            }
            return Colors.transparent;
          }),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          side: const BorderSide(
            color: AppColors.bodyText,
            width: 1.5,
          ),
        ),
        textTheme: GoogleFonts.ibmPlexSansArabicTextTheme(
          const TextTheme(
            headlineMedium: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: AppColors.darkText,
            ),
            titleMedium: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryBlue,
            ),
            titleSmall: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryBlue,
            ),
            bodySmall: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.normal,
              color: AppColors.bodyText,
              height: 1.5,
            ),
            labelMedium: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.darkText,
            ),
            bodyMedium: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: AppColors.darkText,
            ),
            labelLarge: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            labelSmall: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: AppColors.bodyText,
            ),
          ),
        ),
      );

  static ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.darkBackground,
        dividerColor: AppColors.darkBorder,
        extensions: [AppThemeColors.dark],
        cardTheme: CardThemeData(
          color: AppColors.darkCardBackground,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.darkInputBackground,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: AppColors.darkBorder),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: AppColors.darkBorder),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(
              color: AppColors.darkPrimaryText,
              width: 1.5,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 13,
          ),
          hintStyle: const TextStyle(
            color: AppColors.darkSecondaryText,
            fontSize: 12,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryBlue,
            foregroundColor: Colors.white,
            elevation: 0,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        checkboxTheme: CheckboxThemeData(
          fillColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.darkPrimaryText;
            }
            return Colors.transparent;
          }),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          side: const BorderSide(
            color: AppColors.darkSecondaryText,
            width: 1.5,
          ),
        ),
        textTheme: GoogleFonts.ibmPlexSansArabicTextTheme(
          const TextTheme(
            headlineMedium: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: AppColors.darkPrimaryText,
            ),
            titleMedium: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.darkPrimaryText,
            ),
            titleSmall: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: AppColors.darkPrimaryText,
            ),
            bodySmall: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.normal,
              color: AppColors.darkSecondaryText,
              height: 1.5,
            ),
            labelMedium: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.darkSecondaryText,
            ),
            bodyMedium: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: AppColors.darkSecondaryText,
            ),
            labelLarge: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            labelSmall: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: AppColors.darkSecondaryText,
            ),
          ),
        ),
      );
}
