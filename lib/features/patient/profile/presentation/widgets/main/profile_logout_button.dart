import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/core/widgets/tap_scale_widget.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class ProfileLogoutButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ProfileLogoutButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final colors = context.appColors;
    final textTheme = context.textTheme;

    return TapScaleWidget(
      scale: 0.96,
      onTap: () {
        HapticFeedback.lightImpact();
        onPressed();
      },
      child: Container(
        width: double.infinity,
        height: 48.h,
        decoration: BoxDecoration(
          color: colors.redSurface.withValues(alpha: 0.45),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: AppColors.heartRateRed.withValues(alpha: 0.25),
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          s.signOut,
          style: textTheme.labelLarge?.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.heartRateRed,
          ),
        ),
      ),
    );
  }
}
