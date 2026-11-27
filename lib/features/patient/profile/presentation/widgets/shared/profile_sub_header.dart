import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/core/widgets/tap_scale_widget.dart';

class ProfileSubHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData? trailingIcon;
  final VoidCallback? onTrailingTap;

  const ProfileSubHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.trailingIcon,
    this.onTrailingTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final textTheme = context.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _HeaderIconButton(
              icon: context.backChevron,
              onTap: () => context.pop(),
            ),
            if (trailingIcon != null)
              _HeaderIconButton(
                icon: trailingIcon!,
                onTap: onTrailingTap ?? () {},
              ),
          ],
        ),
        SizedBox(height: 16.h),
        Text(
          title,
          style: textTheme.headlineMedium?.copyWith(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: colors.brandNavy,
          ),
        ),
        SizedBox(height: 2.h),
        Text(
          subtitle,
          style: textTheme.bodySmall?.copyWith(
            fontSize: 12.sp,
            color: colors.secondaryText,
          ),
        ),
      ],
    );
  }
}

class _HeaderIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _HeaderIconButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    return TapScaleWidget(
      scale: 0.94,
      onTap: onTap,
      child: Container(
        width: 42.r,
        height: 42.r,
        decoration: BoxDecoration(
          color: colors.cardBackground,
          borderRadius: BorderRadius.circular(14.r),
          boxShadow: const [
            BoxShadow(
              color: AppColors.shadowColor,
              blurRadius: 10,
              offset: Offset(0, 2),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Icon(icon, color: colors.primaryText, size: 22.sp),
      ),
    );
  }
}
