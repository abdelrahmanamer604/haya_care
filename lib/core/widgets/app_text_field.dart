import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/utils/extensions.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final EdgeInsetsGeometry? contentPadding;
  final double? borderRadius;
  final Color? fillColor;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final double? fontSize;
  final Color? hintColor;
  final Color? textColor;
  final VoidCallback? onTap;

  const AppTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.contentPadding,
    this.borderRadius,
    this.fillColor,
    this.borderColor,
    this.focusedBorderColor,
    this.fontSize,
    this.hintColor,
    this.textColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final textTheme = theme.textTheme;
    final inputTheme = theme.inputDecorationTheme;
    final colors = context.appColors;
    final resolvedHintColor =
        hintColor ?? inputTheme.hintStyle?.color ?? colors.secondaryText;

    OutlineInputBorder? customBorder(Color? color, {double width = 1.0}) {
      if (color == null && borderRadius == null) return null;
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular((borderRadius ?? 14.0).r),
        borderSide: BorderSide(
          color: color ?? colors.borderColor,
          width: width,
        ),
      );
    }

    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onTap: onTap,
      style: textTheme.bodyMedium?.copyWith(
        fontSize: fontSize?.sp,
        color: textColor,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintMaxLines: 2,
        hintStyle: textTheme.bodySmall?.copyWith(
          fontSize: (fontSize != null ? fontSize! - 1 : 11.5).sp,
          color: resolvedHintColor,
          height: 1.25,
        ),
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: resolvedHintColor, size: 20.sp)
            : null,
        suffixIcon: suffixIcon,
        fillColor: fillColor,
        contentPadding: contentPadding,
        border: customBorder(borderColor),
        enabledBorder: customBorder(borderColor),
        focusedBorder: customBorder(focusedBorderColor, width: 1.5),
      ),
    );
  }
}
