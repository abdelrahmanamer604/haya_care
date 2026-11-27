import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  const Responsive({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  static const double mobileMaxWidth = 600;
  static const double tabletMaxWidth = 1024;

  static bool isMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width < mobileMaxWidth;

  static bool isTablet(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= mobileMaxWidth &&
      MediaQuery.sizeOf(context).width < tabletMaxWidth;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= tabletMaxWidth;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    if (width >= tabletMaxWidth && desktop != null) {
      return desktop!;
    } else if (width >= mobileMaxWidth && tablet != null) {
      return tablet!;
    } else {
      return mobile;
    }
  }
}

class AdaptiveScaffoldWrapper extends StatelessWidget {
  final Widget child;
  final double maxContentWidth;

  const AdaptiveScaffoldWrapper({
    super.key,
    required this.child,
    this.maxContentWidth = 600,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final effectiveMaxWidth =
        screenWidth >= Responsive.tabletMaxWidth ? maxContentWidth : screenWidth;

    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: effectiveMaxWidth),
        child: child,
      ),
    );
  }
}
