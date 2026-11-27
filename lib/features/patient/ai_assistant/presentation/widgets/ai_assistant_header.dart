import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class AiAssistantHeader extends StatelessWidget {
  final VoidCallback onClose;
  final VoidCallback onClear;

  const AiAssistantHeader({super.key, required this.onClose, required this.onClear});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final textTheme = context.textTheme;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: AppColors.splashBackground,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      child: Row(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 40.r,
                height: 40.r,
                decoration: BoxDecoration(
                  color: AppColors.white.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                alignment: Alignment.center,
                child: Icon(Icons.favorite_border_rounded,
                    color: AppColors.white, size: 20.sp),
              ),
              PositionedDirectional(
                bottom: -2.h,
                end: -2.w,
                child: Container(
                  width: 9.r,
                  height: 9.r,
                  decoration: BoxDecoration(
                    color: AppColors.successGreen,
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: AppColors.splashBackground, width: 1.5),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(s.aiAssistantTitle,
                    style: textTheme.titleSmall?.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white)),
                SizedBox(height: 2.h),
                Text(s.aiAssistantSubtitle,
                    style: textTheme.labelSmall?.copyWith(
                        fontSize: 10.sp, color: AppColors.splashSubtitleText)),
              ],
            ),
          ),
          _HeaderBtn(icon: Icons.delete_sweep_outlined, onTap: onClear),
          SizedBox(width: 6.w),
          _HeaderBtn(icon: Icons.close_rounded, onTap: onClose),
        ],
      ),
    );
  }
}

class _HeaderBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _HeaderBtn({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10.r),
      child: Container(
        width: 30.r,
        height: 30.r,
        decoration: BoxDecoration(
          color: AppColors.white.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(10.r),
        ),
        alignment: Alignment.center,
        child: Icon(icon, color: AppColors.white, size: 16.sp),
      ),
    );
  }
}
