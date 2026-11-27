import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/app_feedback.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/core/widgets/app_button.dart';
import 'package:haya_care/core/widgets/app_delete_outline_button.dart';
import 'package:haya_care/features/patient/profile/data/profile_demo_data.dart';
import 'package:haya_care/features/patient/profile/presentation/controllers/add_medication_controller.dart';
import 'package:haya_care/features/patient/profile/presentation/controllers/profile_sub_controllers.dart';
import 'package:haya_care/features/patient/profile/presentation/widgets/medications/add_medication_fields.dart';
import 'package:haya_care/features/patient/profile/presentation/widgets/medications/add_medication_meal_chips.dart';
import 'package:haya_care/l10n/app_localizations.dart';

Future<void> showAddMedicationBottomSheet(
  BuildContext context,
  PatientMedicationsController medicationsController, {
  MedicationDoseModel? existingDose,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.transparent,
    builder: (_) => AddMedicationBottomSheet(
      medicationsController: medicationsController,
      existingDose: existingDose,
    ),
  );
}

class AddMedicationBottomSheet extends StatefulWidget {
  final PatientMedicationsController medicationsController;
  final MedicationDoseModel? existingDose;

  const AddMedicationBottomSheet({
    super.key,
    required this.medicationsController,
    this.existingDose,
  });

  @override
  State<AddMedicationBottomSheet> createState() =>
      _AddMedicationBottomSheetState();
}

class _AddMedicationBottomSheetState extends State<AddMedicationBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final AddMedicationController _formController = AddMedicationController();
  late final TextEditingController _nameController;
  late final TextEditingController _dosageController;
  late final TextEditingController _frequencyController;

  bool get _isEditing => widget.existingDose != null;

  @override
  void initState() {
    super.initState();
    final existing = widget.existingDose;
    final parts = existing?.dosage.split(' · ') ?? [];
    _nameController = TextEditingController(text: existing?.name ?? '');
    _dosageController = TextEditingController(text: parts.isNotEmpty ? parts[0] : '');
    _frequencyController = TextEditingController(text: parts.length > 1 ? parts[1] : '');
  }

  @override
  void dispose() {
    _formController.dispose();
    _nameController.dispose();
    _dosageController.dispose();
    _frequencyController.dispose();
    super.dispose();
  }

  Future<void> _pickTime() async {
    final picked = await showTimePicker(context: context, initialTime: _formController.selectedTime ?? TimeOfDay.now());
    if (picked != null) _formController.setTime(picked);
  }

  void _save(S s) {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    final freq = _frequencyController.text.trim().isEmpty ? s.frequencyHint : _frequencyController.text.trim();
    final schedule = _formController.buildSchedule(s: s, frequency: freq, formattedTime: _formController.selectedTime?.format(context));
    if (_isEditing) {
      widget.medicationsController.updateMedication(id: widget.existingDose!.id, name: _nameController.text, dosage: _dosageController.text.trim(), frequency: freq, schedule: schedule);
      context.pop();
      AppFeedback.showSuccess(context, s.medicationUpdatedSuccess);
    } else {
      widget.medicationsController.addMedication(name: _nameController.text, dosage: _dosageController.text.trim(), frequency: freq, schedule: schedule);
      context.pop();
      AppFeedback.showSuccess(context, s.medicationAddedSuccess);
    }
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
        child: ListenableBuilder(
          listenable: _formController,
          builder: (context, _) => SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
                Center(child: Container(width: 40.w, height: 4.h, decoration: BoxDecoration(color: colors.borderColor, borderRadius: BorderRadius.circular(4.r)))),
                SizedBox(height: 14.h),
                Text(_isEditing ? s.editMedicationTitle : s.addMedicationTitle, style: textTheme.headlineMedium?.copyWith(fontSize: 22.sp, fontWeight: FontWeight.bold, color: colors.brandNavy)),
                SizedBox(height: 2.h),
                Text(s.addMedicationSubtitle, style: textTheme.bodySmall?.copyWith(fontSize: 11.5.sp, color: colors.secondaryText)),
                SizedBox(height: 18.h),
                AddMedicationField(label: s.medicationNameLabel, hint: s.medicationNameHint, controller: _nameController, prefixIcon: Icons.medication_outlined, validator: (v) => (v == null || v.trim().isEmpty) ? s.fieldRequiredError : null),
                SizedBox(height: 14.h),
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Expanded(child: AddMedicationField(label: s.dosageLabel, hint: s.dosageHint, controller: _dosageController, validator: (v) => (v == null || v.trim().isEmpty) ? s.fieldRequiredError : null)),
                  SizedBox(width: 10.w),
                  Expanded(child: AddMedicationField(label: s.frequencyLabel, hint: s.frequencyHint, controller: _frequencyController, textInputAction: TextInputAction.done)),
                ]),
                SizedBox(height: 14.h),
                AddMedicationTimeField(label: s.doseTimeLabel, displayValue: _formController.selectedTime?.format(context) ?? s.doseTimeHint, hasValue: _formController.selectedTime != null, onTap: _pickTime),
                SizedBox(height: 14.h),
                AddMedicationMealChips(label: s.mealTimingLabel, options: _formController.mealLabels(s), selected: _formController.selectedMeal, onSelected: _formController.toggleMeal),
                SizedBox(height: 12.h),
                AddMedicationReminderRow(title: s.doseReminderTitle, subtitle: s.doseReminderSubtitle, value: _formController.reminderEnabled, onChanged: _formController.setReminder),
                SizedBox(height: 16.h),
                AppButton(text: _isEditing ? s.updateButton : s.saveMedicationButton, leadingIcon: Icons.check_rounded, onPressed: () => _save(s)),
                if (_isEditing) ...[
                  SizedBox(height: 10.h),
                  AppDeleteOutlineButton(label: s.deleteButton, borderRadius: 14, onPressed: () { widget.medicationsController.deleteMedication(widget.existingDose!.id); context.pop(); AppFeedback.showSuccess(context, s.medicationDeletedSuccess); }),
                ],
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
