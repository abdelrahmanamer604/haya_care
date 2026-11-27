import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/features/patient/profile/presentation/widgets/medications/add_medication_fields.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class EmergencyEditInfoCard extends StatefulWidget {
  final String initialName;
  final String initialRelation;
  final String initialPhone;
  final String initialAllergy;
  final VoidCallback onCancel;
  final void Function(String name, String relation, String phone, String allergy) onSave;

  const EmergencyEditInfoCard({
    super.key,
    required this.initialName,
    required this.initialRelation,
    required this.initialPhone,
    required this.initialAllergy,
    required this.onCancel,
    required this.onSave,
  });

  @override
  State<EmergencyEditInfoCard> createState() => _EmergencyEditInfoCardState();
}

class _EmergencyEditInfoCardState extends State<EmergencyEditInfoCard> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameCtrl;
  late final TextEditingController _relCtrl;
  late final TextEditingController _phoneCtrl;
  late final TextEditingController _allergyCtrl;

  @override
  void initState() {
    super.initState();
    _nameCtrl = TextEditingController(text: widget.initialName);
    _relCtrl = TextEditingController(text: widget.initialRelation);
    _phoneCtrl = TextEditingController(text: widget.initialPhone);
    _allergyCtrl = TextEditingController(text: widget.initialAllergy);
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _relCtrl.dispose();
    _phoneCtrl.dispose();
    _allergyCtrl.dispose();
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
        boxShadow: const [BoxShadow(color: AppColors.shadowColor, blurRadius: 10, offset: Offset(0, 3))],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(s.editEmergencyInfoTitle,
                style: textTheme.titleSmall?.copyWith(fontSize: 15.sp, fontWeight: FontWeight.bold, color: colors.brandNavy)),
            SizedBox(height: 12.h),
            AddMedicationField(label: s.contactPersonLabel, hint: s.emergencyContactName, controller: _nameCtrl, validator: (v) => (v == null || v.trim().isEmpty) ? s.fieldRequiredError : null),
            SizedBox(height: 10.h),
            AddMedicationField(label: s.relationshipLabel, hint: s.emergencyContactRelation, controller: _relCtrl, validator: (v) => (v == null || v.trim().isEmpty) ? s.fieldRequiredError : null),
            SizedBox(height: 10.h),
            AddMedicationField(label: s.phoneLabel, hint: s.emergencyContactPhone, controller: _phoneCtrl, validator: (v) => (v == null || v.trim().isEmpty) ? s.fieldRequiredError : null),
            SizedBox(height: 10.h),
            AddMedicationField(label: s.allergiesTitle, hint: s.allergyShortValue, controller: _allergyCtrl, textInputAction: TextInputAction.done),
            SizedBox(height: 14.h),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        widget.onSave(_nameCtrl.text, _relCtrl.text, _phoneCtrl.text, _allergyCtrl.text);
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
