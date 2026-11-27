import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class AuthSecurityFooter extends StatelessWidget {
  const AuthSecurityFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final colors = context.appColors;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.lock_outline_rounded,
          size: 14.sp,
          color: colors.secondaryText,
        ),
        SizedBox(width: 6.w),
        Text(
          s.dataEncryptedNew,
          style: context.textTheme.labelSmall?.copyWith(
            fontSize: 11.sp,
            color: colors.secondaryText,
          ),
        ),
      ],
    );
  }
}
