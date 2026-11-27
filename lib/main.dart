import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/routing/app_router.dart';
import 'package:haya_care/core/routing/routes.dart';
import 'package:haya_care/core/theme/app_theme.dart';
import 'package:haya_care/core/utils/app_state.dart';
import 'package:haya_care/l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppState.init();
  runApp(HayaCareApp(appRouter: AppRouter()));
}

class HayaCareApp extends StatelessWidget {
  final AppRouter appRouter;

  const HayaCareApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return ScreenUtilInit(
          designSize: orientation == Orientation.landscape
              ? const Size(812, 375)
              : const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return ValueListenableBuilder<ThemeMode>(
              valueListenable: AppState.themeMode,
              builder: (context, currentThemeMode, _) {
                return ValueListenableBuilder<Locale>(
                  valueListenable: AppState.locale,
                  builder: (context, currentLocale, _) {
                    return ValueListenableBuilder<bool>(
                      valueListenable: AppState.largeTextMode,
                      builder: (context, isLargeText, _) {
                        return MaterialApp(
                          title: 'Haya Care',
                          debugShowCheckedModeBanner: false,
                          theme: AppTheme.lightTheme,
                          darkTheme: AppTheme.darkTheme,
                          themeMode: currentThemeMode,
                          themeAnimationDuration: const Duration(milliseconds: 350),
                          themeAnimationCurve: Curves.easeInOutCubic,
                          locale: currentLocale,
                          localizationsDelegates: S.localizationsDelegates,
                          supportedLocales: S.supportedLocales,
                          initialRoute: Routes.initial,
                          onGenerateRoute: appRouter.generateRoute,
                          builder: (ctx, home) => MediaQuery(
                            data: MediaQuery.of(ctx).copyWith(
                              textScaler: TextScaler.linear(isLargeText ? 1.18 : 1.0),
                            ),
                            child: home ?? const SizedBox.shrink(),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
