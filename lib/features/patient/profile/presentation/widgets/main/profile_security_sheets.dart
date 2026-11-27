import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/app_feedback.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/core/widgets/app_button.dart';
import 'package:haya_care/features/patient/profile/presentation/widgets/medications/add_medication_fields.dart';
import 'package:haya_care/l10n/app_localizations.dart';

Future<void> showPersonalThresholdsSheet(BuildContext context) {
  final s = S.of(context)!;
  final bpCtrl = TextEditingController(text: '140');
  final sugarCtrl = TextEditingController(text: '160');

  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.transparent,
    builder: (ctx) => Container(
      decoration: BoxDecoration(color: ctx.theme.scaffoldBackgroundColor, borderRadius: BorderRadius.vertical(top: Radius.circular(28.r))),
      padding: EdgeInsets.fromLTRB(22.w, 14.h, 22.w, 24.h + MediaQuery.viewInsetsOf(ctx).bottom),
      child: SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(s.personalThresholdsTitle, style: ctx.textTheme.headlineMedium?.copyWith(fontSize: 20.sp, fontWeight: FontWeight.bold, color: ctx.appColors.brandNavy)),
          SizedBox(height: 14.h),
          AddMedicationField(label: s.maxBpThresholdLabel, hint: '140', controller: bpCtrl),
          SizedBox(height: 12.h),
          AddMedicationField(label: s.maxSugarThresholdLabel, hint: '160', controller: sugarCtrl, textInputAction: TextInputAction.done),
          SizedBox(height: 18.h),
          AppButton(
            text: s.saveChangesButton,
            leadingIcon: Icons.check_rounded,
            onPressed: () {
              ctx.pop();
              AppFeedback.showSuccess(context, s.personalInfoUpdatedSuccess);
            },
          ),
        ]),
      ),
    ),
  );
}

Future<void> showSecuritySessionsSheet(BuildContext context) {
  final s = S.of(context)!;
  final passCtrl = TextEditingController();

  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.transparent,
    builder: (ctx) => Container(
      decoration: BoxDecoration(color: ctx.theme.scaffoldBackgroundColor, borderRadius: BorderRadius.vertical(top: Radius.circular(28.r))),
      padding: EdgeInsets.fromLTRB(22.w, 14.h, 22.w, 24.h + MediaQuery.viewInsetsOf(ctx).bottom),
      child: SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(s.securitySessionsTitle, style: ctx.textTheme.headlineMedium?.copyWith(fontSize: 20.sp, fontWeight: FontWeight.bold, color: ctx.appColors.brandNavy)),
          SizedBox(height: 14.h),
          AddMedicationField(label: s.changePasswordTitle, hint: '••••••••', controller: passCtrl, textInputAction: TextInputAction.done),
          SizedBox(height: 14.h),
          Text(s.activeSessionsTitle, style: ctx.textTheme.labelMedium?.copyWith(fontSize: 13.sp, fontWeight: FontWeight.bold, color: ctx.appColors.brandNavy)),
          SizedBox(height: 8.h),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(color: ctx.appColors.cardBackground, borderRadius: BorderRadius.circular(12.r), border: Border.all(color: ctx.appColors.borderColor)),
            child: Text(s.currentDeviceLabel, style: ctx.textTheme.bodySmall?.copyWith(fontSize: 12.5.sp, color: ctx.appColors.brandNavy)),
          ),
          SizedBox(height: 16.h),
          AppButton(
            text: s.endOtherSessionsButton,
            leadingIcon: Icons.security_rounded,
            onPressed: () {
              ctx.pop();
              AppFeedback.showSuccess(context, s.sessionsEndedSuccess);
            },
          ),
        ]),
      ),
    ),
  );
}
