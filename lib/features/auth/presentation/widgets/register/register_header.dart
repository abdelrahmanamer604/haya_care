import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class RegisterHeader extends StatelessWidget {
  final bool isDoctor;

  const RegisterHeader({super.key, required this.isDoctor});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final textTheme = context.textTheme;
    final colors = context.appColors;

    return Column(
      children: [
        Text(
          s.joinHayaCare,
          textAlign: TextAlign.center,
          style: textTheme.titleSmall?.copyWith(
            color: AppColors.orangeBadge,
            fontSize: 13.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 6.h),
        Text(
          s.createAccount,
          textAlign: TextAlign.center,
          style: textTheme.headlineMedium?.copyWith(
            color: colors.brandNavy,
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 6.h),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 280),
          switchInCurve: Curves.easeOutCubic,
          switchOutCurve: Curves.easeInCubic,
          child: Text(
            isDoctor ? s.doctorRegisterSubtitle : s.patientRegisterSubtitle,
            key: ValueKey<bool>(isDoctor),
            textAlign: TextAlign.center,
            style: textTheme.bodySmall?.copyWith(
              color: colors.secondaryText,
              fontSize: 12.sp,
            ),
          ),
        ),
      ],
    );
  }
}
