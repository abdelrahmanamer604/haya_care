import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/core/widgets/app_toast_banner.dart';

class AppFeedback {
  AppFeedback._();

  static OverlayEntry? _activeEntry;

  static void showInfo(BuildContext context, String message) =>
      _show(context, message, Icons.info_outline_rounded, context.appColors.brandNavy);

  static void showSuccess(BuildContext context, String message) =>
      _show(context, message, Icons.check_circle_outline_rounded, AppColors.successGreen);

  static void showError(BuildContext context, String message) =>
      _show(context, message, Icons.error_outline_rounded, AppColors.heartRateRed);

  static void _show(
    BuildContext context,
    String message,
    IconData icon,
    Color bgColor,
  ) {
    _activeEntry?.remove();
    _activeEntry = null;

    final overlay = Overlay.maybeOf(context, rootOverlay: true);
    if (overlay == null) return;

    late final OverlayEntry entry;
    entry = OverlayEntry(
      builder: (_) => AppToastBanner(
        message: message,
        icon: icon,
        backgroundColor: bgColor,
        onDismissed: () {
          if (_activeEntry == entry) _activeEntry = null;
          if (entry.mounted) entry.remove();
        },
      ),
    );
    _activeEntry = entry;
    overlay.insert(entry);
  }

  static Future<bool> showConfirmDialog(
    BuildContext context, {
    required String title,
    required String message,
    required String confirmLabel,
    required String cancelLabel,
    Color? confirmColor,
  }) async {
    final colors = context.appColors;
    final textTheme = context.textTheme;
    final result = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: colors.cardBackground,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
        title: Text(
          title,
          style: textTheme.titleMedium?.copyWith(
            fontSize: 17.sp,
            fontWeight: FontWeight.bold,
            color: colors.brandNavy,
          ),
        ),
        content: Text(
          message,
          style: textTheme.bodySmall?.copyWith(
            fontSize: 13.sp,
            color: colors.secondaryText,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text(
              cancelLabel,
              style: textTheme.labelMedium?.copyWith(
                color: colors.brandNavy,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text(
              confirmLabel,
              style: textTheme.labelMedium?.copyWith(
                color: confirmColor ?? AppColors.orangeBadge,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
    return result == true;
  }
}
