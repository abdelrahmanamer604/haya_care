import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/core/widgets/app_text_field.dart';
import 'package:haya_care/features/patient/vitals/presentation/controllers/vital_value_stepper.dart';

class VitalUnitField extends StatelessWidget {
  final String label;
  final String hint;
  final String unit;
  final TextEditingController controller;
  final bool decimal;

  const VitalUnitField({
    super.key,
    required this.label,
    required this.hint,
    required this.unit,
    required this.controller,
    this.decimal = false,
  });

  void _step(int direction) {
    HapticFeedback.selectionClick();
    VitalValueStepper.step(
      controller,
      fallbackHint: hint,
      direction: direction,
      decimal: decimal,
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colors = context.appColors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: textTheme.labelMedium?.copyWith(
            fontSize: 13.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 6.h),
        AppTextField(
          controller: controller,
          hintText: hint,
          keyboardType: decimal
              ? const TextInputType.numberWithOptions(decimal: true)
              : TextInputType.number,
          suffixIcon: Padding(
            padding: EdgeInsetsDirectional.only(end: 8.w),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _StepArrow(icon: Icons.keyboard_arrow_up_rounded, onTap: () => _step(1)),
                    _StepArrow(icon: Icons.keyboard_arrow_down_rounded, onTap: () => _step(-1)),
                  ],
                ),
                SizedBox(width: 4.w),
                Text(
                  unit,
                  style: textTheme.labelSmall?.copyWith(
                    fontSize: 11.sp,
                    color: colors.secondaryText,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _StepArrow extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _StepArrow({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6.r),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Icon(icon, size: 18.sp, color: context.appColors.brandNavy),
      ),
    );
  }
}
