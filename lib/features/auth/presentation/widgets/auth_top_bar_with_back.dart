import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/features/auth/presentation/widgets/auth_brand_header.dart';

class AuthTopBarWithBack extends StatelessWidget {
  final VoidCallback onBack;

  const AuthTopBarWithBack({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: onBack,
          child: Container(
            width: 40.r,
            height: 40.r,
            decoration: BoxDecoration(
              color: colors.cardBackground,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.shadowColor,
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            alignment: Alignment.center,
            child: Icon(
              context.backChevron,
              color: colors.primaryText,
              size: 22.sp,
            ),
          ),
        ),
        const Expanded(child: AuthBrandHeader()),
        SizedBox(width: 40.r),
      ],
    );
  }
}
