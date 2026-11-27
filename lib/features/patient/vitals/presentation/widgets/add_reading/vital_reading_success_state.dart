import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/core/widgets/animated_success_badge.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class VitalReadingSuccessState extends StatelessWidget {
  const VitalReadingSuccessState({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final textTheme = context.textTheme;
    final colors = context.appColors;

    return Container(
      key: const ValueKey('success_state'),
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 28.h, horizontal: 12.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: colors.borderColor,
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
          SizedBox(height: 28.h),
          const AnimatedSuccessBadge(),
          SizedBox(height: 18.h),
          Text(
            s.readingAddedSuccess,
            textAlign: TextAlign.center,
            style: textTheme.headlineMedium?.copyWith(
              fontSize: 21.sp,
              fontWeight: FontWeight.bold,
              color: colors.brandNavy,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            s.readingAddedSubtitle,
            textAlign: TextAlign.center,
            style: textTheme.bodySmall?.copyWith(
              fontSize: 12.5.sp,
              color: colors.secondaryText,
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
