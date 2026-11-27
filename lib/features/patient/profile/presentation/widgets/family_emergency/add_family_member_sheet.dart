import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/app_feedback.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/core/widgets/app_button.dart';
import 'package:haya_care/features/patient/profile/presentation/controllers/family_emergency_controller.dart';
import 'package:haya_care/features/patient/profile/presentation/widgets/medications/add_medication_fields.dart';
import 'package:haya_care/l10n/app_localizations.dart';

Future<void> showAddFamilyMemberSheet(BuildContext context, FamilyEmergencyController controller) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.transparent,
    builder: (_) => AddFamilyMemberSheet(controller: controller),
  );
}

class AddFamilyMemberSheet extends StatefulWidget {
  final FamilyEmergencyController controller;
  const AddFamilyMemberSheet({super.key, required this.controller});

  @override
  State<AddFamilyMemberSheet> createState() => _AddFamilyMemberSheetState();
}

class _AddFamilyMemberSheetState extends State<AddFamilyMemberSheet> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _relationController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _relationController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _save(S s) {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    widget.controller.addFamilyMember(
      name: _nameController.text,
      relation: _relationController.text,
      email: _emailController.text,
      s: s,
    );
    context.pop();
    AppFeedback.showSuccess(context, s.familyMemberAddedSuccess);
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final colors = context.appColors;
    final textTheme = context.textTheme;
    final bottomInset = MediaQuery.viewInsetsOf(context).bottom;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Container(
        decoration: BoxDecoration(color: context.theme.scaffoldBackgroundColor, borderRadius: BorderRadius.vertical(top: Radius.circular(28.r))),
        padding: EdgeInsets.fromLTRB(22.w, 12.h, 22.w, 24.h + bottomInset),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
              Center(child: Container(width: 40.w, height: 4.h, decoration: BoxDecoration(color: colors.borderColor, borderRadius: BorderRadius.circular(4.r)))),
              SizedBox(height: 14.h),
              Text(s.addFamilyMemberTitle, style: textTheme.headlineMedium?.copyWith(fontSize: 20.sp, fontWeight: FontWeight.bold, color: colors.brandNavy)),
              SizedBox(height: 16.h),
              AddMedicationField(label: s.contactPersonLabel, hint: s.familyMemberNameHint, controller: _nameController, prefixIcon: Icons.person_outline_rounded, validator: (v) => (v == null || v.trim().isEmpty) ? s.fieldRequiredError : null),
              SizedBox(height: 12.h),
              AddMedicationField(label: s.relationshipLabel, hint: s.relationshipHint, controller: _relationController, validator: (v) => (v == null || v.trim().isEmpty) ? s.fieldRequiredError : null),
              SizedBox(height: 12.h),
              AddMedicationField(label: s.email, hint: s.inviteByEmailHint, controller: _emailController, prefixIcon: Icons.mail_outline_rounded, textInputAction: TextInputAction.done, validator: (v) => (v == null || !v.contains('@')) ? s.fieldRequiredError : null),
              SizedBox(height: 18.h),
              AppButton(text: s.saveChangesButton, leadingIcon: Icons.check_rounded, onPressed: () => _save(s)),
            ]),
          ),
        ),
      ),
    );
  }
}
