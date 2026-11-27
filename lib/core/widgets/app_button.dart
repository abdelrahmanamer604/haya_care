import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';

enum AppButtonVariant { primary, outlined, orange }

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final String? leadingAsset;
  final bool useAutoChevron;
  final double? height;
  final double? width;
  final double? borderRadius;
  final bool isLoading;

  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.leadingIcon,
    this.trailingIcon,
    this.leadingAsset,
    this.useAutoChevron = false,
    this.height,
    this.width,
    this.borderRadius,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    Color bgColor;
    Color fgColor;
    BorderSide borderSide = BorderSide.none;

    switch (variant) {
      case AppButtonVariant.primary:
        bgColor = AppColors.splashBackground;
        fgColor = AppColors.white;
        break;
      case AppButtonVariant.orange:
        bgColor = AppColors.orangeBadge;
        fgColor = AppColors.white;
        break;
      case AppButtonVariant.outlined:
        bgColor = colors.cardBackground;
        fgColor = colors.primaryText;
        borderSide = BorderSide(color: colors.borderColor);
        break;
    }

    final resolvedTrailingIcon =
        useAutoChevron ? context.forwardChevron : trailingIcon;

    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 52.h,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: fgColor,
          disabledBackgroundColor: bgColor.withValues(alpha: 0.6),
          disabledForegroundColor: fgColor.withValues(alpha: 0.6),
          elevation: 0,
          side: borderSide,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 14.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
        ),
        child: isLoading
            ? SizedBox(
                width: 22.r,
                height: 22.r,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color: fgColor,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (leadingAsset != null) ...[
                    Image.asset(
                      leadingAsset!,
                      width: 20.w,
                      height: 20.h,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(width: 8.w),
                  ] else if (leadingIcon != null) ...[
                    Icon(leadingIcon, size: 20.sp, color: fgColor),
                    SizedBox(width: 8.w),
                  ],
                  Text(
                    text,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: fgColor,
                        ),
                  ),
                  if (resolvedTrailingIcon != null) ...[
                    SizedBox(width: 8.w),
                    Icon(resolvedTrailingIcon, size: 20.sp, color: fgColor),
                  ],
                ],
              ),
      ),
    );
  }
}
