import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/widgets/app_button.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class OnboardingButton extends StatelessWidget {
  final bool isLastPage;
  final VoidCallback onPressed;

  const OnboardingButton({
    super.key,
    required this.isLastPage,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: AppButton(
        text: isLastPage ? s.getStarted : s.next,
        useAutoChevron: true,
        borderRadius: 16.r,
        onPressed: onPressed,
      ),
    );
  }
}
