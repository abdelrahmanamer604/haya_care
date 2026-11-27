import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/routing/routes.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/core/utils/responsive.dart';
import 'package:haya_care/features/patient/profile/presentation/controllers/medical_record_controller.dart';
import 'package:haya_care/features/patient/profile/presentation/widgets/medical_record/edit_medical_list_sheet.dart';
import 'package:haya_care/features/patient/profile/presentation/widgets/medical_record/medical_record_section_card.dart';
import 'package:haya_care/features/patient/profile/presentation/widgets/shared/profile_sub_header.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class PatientMedicalRecordScreen extends StatefulWidget {
  const PatientMedicalRecordScreen({super.key});

  @override
  State<PatientMedicalRecordScreen> createState() =>
      _PatientMedicalRecordScreenState();
}

class _PatientMedicalRecordScreenState
    extends State<PatientMedicalRecordScreen> {
  final MedicalRecordController _controller = MedicalRecordController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller.initIfNeeded(S.of(context)!);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final colors = context.appColors;
    final textTheme = context.textTheme;

    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: SafeArea(
        bottom: false,
        child: AdaptiveScaffoldWrapper(
          maxContentWidth: 440,
          child: ListenableBuilder(
            listenable: _controller,
            builder: (context, _) => SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.fromLTRB(20.w, 14.h, 20.w, 28.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileSubHeader(title: s.medicalRecordTitle, subtitle: s.medicalRecordPageSubtitle),
                  SizedBox(height: 18.h),
                  MedicalRecordSectionCard(
                    icon: Icons.favorite_border_rounded,
                    title: s.healthConditionsTitle,
                    actionLabel: s.editAction,
                    onActionTap: () => showEditMedicalListSheet(context, title: s.healthConditionsTitle, category: MedicalRecordCategory.conditions, controller: _controller),
                    child: _BulletList(items: _controller.conditions, emptyText: s.noItemsAddedYet),
                  ),
                  SizedBox(height: 14.h),
                  MedicalRecordSectionCard(
                    icon: Icons.monitor_heart_outlined,
                    title: s.allergiesTitle,
                    actionLabel: s.editAction,
                    onActionTap: () => showEditMedicalListSheet(context, title: s.allergiesTitle, category: MedicalRecordCategory.allergies, controller: _controller),
                    child: _BulletList(items: _controller.allergies, emptyText: s.noItemsAddedYet),
                  ),
                  SizedBox(height: 14.h),
                  MedicalRecordSectionCard(
                    icon: Icons.medication_outlined,
                    title: s.currentMedicationsTitle,
                    actionLabel: s.editAction,
                    onActionTap: () => showEditMedicalListSheet(context, title: s.currentMedicationsTitle, category: MedicalRecordCategory.medications, controller: _controller),
                    child: _BulletList(items: _controller.medications, emptyText: s.noItemsAddedYet),
                  ),
                  SizedBox(height: 14.h),
                  MedicalRecordSectionCard(
                    icon: Icons.person_outline_rounded,
                    title: s.emergencyContactTitle,
                    actionLabel: s.manageAction,
                    iconBgColor: colors.navySurface,
                    iconColor: colors.brandNavy,
                    onActionTap: () =>
                        context.pushNamed(Routes.familyEmergency),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${s.emergencyContactName} · ${s.emergencyContactRelation}',
                            style: textTheme.labelMedium?.copyWith(fontSize: 13.5.sp, fontWeight: FontWeight.bold, color: colors.brandNavy)),
                        SizedBox(height: 4.h),
                        Text(s.emergencyContactPhone, textDirection: TextDirection.ltr,
                            style: textTheme.bodySmall?.copyWith(fontSize: 12.sp, color: colors.secondaryText)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BulletList extends StatelessWidget {
  final List<String> items;
  final String emptyText;
  const _BulletList({required this.items, required this.emptyText});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final textTheme = context.textTheme;
    if (items.isEmpty) {
      return Text(emptyText, style: textTheme.bodySmall?.copyWith(fontSize: 12.sp, color: colors.secondaryText));
    }
    return Column(
      children: items
          .map((text) => Padding(
                padding: EdgeInsets.only(bottom: 6.h),
                child: Row(children: [
                  Container(width: 6.r, height: 6.r, decoration: BoxDecoration(color: colors.brandNavy, shape: BoxShape.circle)),
                  SizedBox(width: 10.w),
                  Expanded(child: Text(text, style: textTheme.bodySmall?.copyWith(fontSize: 13.sp, color: colors.secondaryText))),
                ]),
              ))
          .toList(),
    );
  }
}
