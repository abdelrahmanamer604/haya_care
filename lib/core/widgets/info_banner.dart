import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoBanner extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double horizontalPadding;
  final double verticalPadding;
  final double borderRadius;
  final Color? borderColor;

  const InfoBanner({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    this.horizontalPadding = 12.0,
    this.verticalPadding = 10.0,
    this.borderRadius = 12.0,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding.w,
        vertical: verticalPadding.h,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius.r),
        border: borderColor != null ? Border.all(color: borderColor!) : null,
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              fontSize: 10.sp,
              color: textColor,
              height: 1.4,
            ),
      ),
    );
  }
}
