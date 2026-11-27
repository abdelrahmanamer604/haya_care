import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';

class EmergencyCardInfoRow extends StatelessWidget {
  final String label;
  final String value;
  final Color? line;

  const EmergencyCardInfoRow({
    super.key,
    required this.label,
    required this.value,
    required this.line,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      decoration: line != null
          ? BoxDecoration(border: Border(bottom: BorderSide(color: line!)))
          : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: textTheme.labelSmall?.copyWith(
                  fontSize: 10.5.sp, color: AppColors.splashSubtitleText)),
          SizedBox(width: 10.w),
          Flexible(
            child: Text(value,
                textAlign: TextAlign.end,
                style: textTheme.labelMedium?.copyWith(
                    fontSize: 11.5.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white)),
          ),
        ],
      ),
    );
  }
}

class EmergencyCardActionBtn extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const EmergencyCardActionBtn({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 6.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.white, size: 15.sp),
            SizedBox(width: 5.w),
            Flexible(
              child: Text(label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.labelSmall
                      ?.copyWith(fontSize: 11.sp, color: AppColors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
