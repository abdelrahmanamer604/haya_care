import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/features/patient/profile/presentation/widgets/medications/add_medication_fields.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class ProfileEditPersonalCard extends StatefulWidget {
  final String initialName;
  final String initialEmail;
  final VoidCallback onCancel;
  final void Function(String name, String email) onSave;

  const ProfileEditPersonalCard({
    super.key,
    required this.initialName,
    required this.initialEmail,
    required this.onCancel,
    required this.onSave,
  });

  @override
  State<ProfileEditPersonalCard> createState() =>
      _ProfileEditPersonalCardState();
}

class _ProfileEditPersonalCardState extends State<ProfileEditPersonalCard> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameCtrl;
  late final TextEditingController _emailCtrl;

  @override
  void initState() {
    super.initState();
    _nameCtrl = TextEditingController(text: widget.initialName);
    _emailCtrl = TextEditingController(text: widget.initialEmail);
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final colors = context.appColors;
    final textTheme = context.textTheme;

    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: colors.cardBackground,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: const [
          BoxShadow(color: AppColors.shadowColor, blurRadius: 12, offset: Offset(0, 3)),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(s.editPersonalInfo,
                style: textTheme.titleSmall?.copyWith(fontSize: 15.sp, fontWeight: FontWeight.bold, color: colors.brandNavy)),
            SizedBox(height: 12.h),
            AddMedicationField(
              label: s.fullNameLabel,
              hint: s.profileDemoName,
              controller: _nameCtrl,
              validator: (v) => (v == null || v.trim().isEmpty) ? s.fieldRequiredError : null,
            ),
            SizedBox(height: 10.h),
            AddMedicationField(
              label: s.email,
              hint: s.profileDemoEmail,
              controller: _emailCtrl,
              textInputAction: TextInputAction.done,
              validator: (v) => (v == null || v.trim().isEmpty) ? s.fieldRequiredError : null,
            ),
            SizedBox(height: 14.h),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        widget.onSave(_nameCtrl.text, _emailCtrl.text);
                      }
                    },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.splashBackground,
                    foregroundColor: AppColors.white,
                    elevation: 0,
                    minimumSize: Size.fromHeight(44.h),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                  ),
                  child: Text(s.saveChangesButton, style: textTheme.labelMedium?.copyWith(fontSize: 12.sp, fontWeight: FontWeight.bold, color: AppColors.white)),
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: OutlinedButton(
                  onPressed: widget.onCancel,
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: colors.borderColor),
                    minimumSize: Size.fromHeight(44.h),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                  ),
                  child: Text(s.cancelButton, style: textTheme.labelMedium?.copyWith(fontSize: 12.sp, fontWeight: FontWeight.bold, color: colors.secondaryText)),
                ),
              ),
            ],
          ),
        ],
        ),
      ),
    );
  }
}
