import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/app_feedback.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/core/widgets/app_button.dart';
import 'package:haya_care/features/patient/profile/presentation/controllers/medical_record_controller.dart';
import 'package:haya_care/l10n/app_localizations.dart';

Future<void> showEditMedicalListSheet(
  BuildContext context, {
  required String title,
  required MedicalRecordCategory category,
  required MedicalRecordController controller,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.transparent,
    builder: (_) => EditMedicalListSheet(title: title, category: category, controller: controller),
  );
}

class EditMedicalListSheet extends StatefulWidget {
  final String title;
  final MedicalRecordCategory category;
  final MedicalRecordController controller;

  const EditMedicalListSheet({
    super.key,
    required this.title,
    required this.category,
    required this.controller,
  });

  @override
  State<EditMedicalListSheet> createState() => _EditMedicalListSheetState();
}

class _EditMedicalListSheetState extends State<EditMedicalListSheet> {
  final _inputController = TextEditingController();

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  void _addItem() {
    if (_inputController.text.trim().isEmpty) return;
    HapticFeedback.selectionClick();
    widget.controller.addItem(widget.category, _inputController.text);
    _inputController.clear();
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
        decoration: BoxDecoration(
          color: context.theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(28.r)),
        ),
        padding: EdgeInsets.fromLTRB(22.w, 12.h, 22.w, 24.h + bottomInset),
        child: ListenableBuilder(
          listenable: widget.controller,
          builder: (context, _) {
            final items = widget.controller.itemsFor(widget.category);
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Container(width: 40.w, height: 4.h, decoration: BoxDecoration(color: colors.borderColor, borderRadius: BorderRadius.circular(4.r)))),
                  SizedBox(height: 14.h),
                  Text(widget.title, style: textTheme.headlineMedium?.copyWith(fontSize: 20.sp, fontWeight: FontWeight.bold, color: colors.brandNavy)),
                  SizedBox(height: 14.h),
                  Row(children: [
                    Expanded(
                      child: TextField(
                        controller: _inputController,
                        textInputAction: TextInputAction.done,
                        onSubmitted: (_) => _addItem(),
                        style: textTheme.bodySmall?.copyWith(fontSize: 13.sp),
                        decoration: InputDecoration(
                          hintText: s.addNewItemHint,
                          hintStyle: textTheme.bodySmall?.copyWith(fontSize: 12.sp, color: colors.secondaryText),
                          filled: true,
                          fillColor: colors.cardBackground,
                          contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 13.h),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r), borderSide: BorderSide(color: colors.borderColor)),
                          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r), borderSide: BorderSide(color: colors.borderColor)),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    InkWell(
                      onTap: _addItem,
                      borderRadius: BorderRadius.circular(12.r),
                      child: Container(
                        width: 46.r,
                        height: 46.r,
                        decoration: BoxDecoration(color: AppColors.orangeBadge, borderRadius: BorderRadius.circular(12.r)),
                        alignment: Alignment.center,
                        child: Icon(Icons.add_rounded, color: AppColors.white, size: 22.sp),
                      ),
                    ),
                  ]),
                  SizedBox(height: 14.h),
                  if (items.isEmpty)
                    Padding(padding: EdgeInsets.symmetric(vertical: 12.h), child: Text(s.noItemsAddedYet, style: textTheme.bodySmall?.copyWith(fontSize: 12.sp, color: colors.secondaryText)))
                  else
                    ...List.generate(items.length, (i) => Container(
                      margin: EdgeInsets.only(bottom: 8.h),
                      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
                      decoration: BoxDecoration(color: colors.cardBackground, borderRadius: BorderRadius.circular(12.r), border: Border.all(color: colors.borderColor.withValues(alpha: 0.6))),
                      child: Row(children: [
                        Expanded(child: Text(items[i], style: textTheme.bodySmall?.copyWith(fontSize: 13.sp, color: colors.brandNavy))),
                        InkWell(onTap: () => widget.controller.removeItem(widget.category, i), child: Icon(Icons.close_rounded, size: 18.sp, color: AppColors.heartRateRed)),
                      ]),
                    )),
                  SizedBox(height: 12.h),
                  AppButton(
                    text: s.saveChangesButton,
                    leadingIcon: Icons.check_rounded,
                    onPressed: () {
                      context.pop();
                      AppFeedback.showSuccess(context, s.medicalRecordUpdatedSuccess);
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
