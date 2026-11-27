import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/features/patient/profile/presentation/controllers/family_emergency_controller.dart';
import 'package:haya_care/features/patient/profile/presentation/widgets/family_emergency/emergency_edit_info_card.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class EmergencyInfoSection extends StatelessWidget {
  final FamilyEmergencyController controller;
  final VoidCallback onSaved;

  const EmergencyInfoSection({super.key, required this.controller, required this.onSaved});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final colors = context.appColors;
    final textTheme = context.textTheme;
    final divider = Divider(height: 1, color: colors.borderColor.withValues(alpha: 0.5));

    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(s.emergencyInfoSectionTitle, style: textTheme.titleMedium?.copyWith(fontSize: 16.sp, fontWeight: FontWeight.bold, color: colors.brandNavy)),
          if (!controller.isEditingInfo)
            GestureDetector(onTap: controller.startEditing, child: Text(s.editAction, style: textTheme.labelMedium?.copyWith(fontSize: 12.sp, fontWeight: FontWeight.bold, color: AppColors.orangeBadge))),
        ]),
        SizedBox(height: 10.h),
        if (controller.isEditingInfo)
          EmergencyEditInfoCard(
            initialName: controller.contactName,
            initialRelation: controller.relationship,
            initialPhone: controller.phone,
            initialAllergy: controller.allergy,
            onCancel: controller.cancelEditing,
            onSave: (name, rel, phone, allergy) {
              controller.saveEmergencyInfo(name: name, relation: rel, phoneNumber: phone, allergyText: allergy);
              onSaved();
            },
          )
        else
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
            decoration: BoxDecoration(color: colors.cardBackground, borderRadius: BorderRadius.circular(18.r), boxShadow: const [BoxShadow(color: AppColors.shadowColor, blurRadius: 10, offset: Offset(0, 3))]),
            child: Column(children: [
              _InfoLine(label: s.contactPersonLabel, value: controller.contactName),
              divider,
              _InfoLine(label: s.relationshipLabel, value: controller.relationship),
              divider,
              _InfoLine(label: s.phoneLabel, value: controller.phone, isLtr: true),
            ]),
          ),
      ],
    );
  }
}

class _InfoLine extends StatelessWidget {
  final String label, value;
  final bool isLtr;
  const _InfoLine({required this.label, required this.value, this.isLtr = false});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final textTheme = context.textTheme;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(label, style: textTheme.labelMedium?.copyWith(fontSize: 12.5.sp, color: colors.secondaryText)),
        Text(value, textDirection: isLtr ? TextDirection.ltr : null, style: textTheme.labelMedium?.copyWith(fontSize: 13.sp, fontWeight: FontWeight.bold, color: colors.brandNavy)),
      ]),
    );
  }
}

class FamilyMembersSection extends StatelessWidget {
  final List<FamilyMemberModel> members;
  final VoidCallback onAddTap;
  final ValueChanged<int> onEndLink;

  const FamilyMembersSection({super.key, required this.members, required this.onAddTap, required this.onEndLink});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final colors = context.appColors;
    final textTheme = context.textTheme;

    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(s.familyMembersSectionTitle, style: textTheme.titleMedium?.copyWith(fontSize: 16.sp, fontWeight: FontWeight.bold, color: colors.brandNavy)),
          GestureDetector(onTap: onAddTap, child: Text(s.addMemberAction, style: textTheme.labelMedium?.copyWith(fontSize: 12.sp, fontWeight: FontWeight.bold, color: AppColors.orangeBadge))),
        ]),
        SizedBox(height: 10.h),
        ...List.generate(members.length, (i) {
          final m = members[i];
          final badgeColor = m.isPending ? AppColors.warningAmber : AppColors.successGreen;
          final badgeBg = m.isPending ? colors.warningSurface : colors.greenSurface;
          return Container(
            margin: EdgeInsets.only(bottom: 10.h),
            padding: EdgeInsets.all(14.r),
            decoration: BoxDecoration(color: colors.cardBackground, borderRadius: BorderRadius.circular(18.r), boxShadow: const [BoxShadow(color: AppColors.shadowColor, blurRadius: 10, offset: Offset(0, 3))]),
            child: Column(children: [
              Row(children: [
                Container(width: 44.r, height: 44.r, decoration: BoxDecoration(color: colors.navySurface, borderRadius: BorderRadius.circular(12.r)), alignment: Alignment.center, child: Text(m.initials, style: textTheme.labelMedium?.copyWith(fontSize: 14.sp, fontWeight: FontWeight.bold, color: colors.brandNavy))),
                SizedBox(width: 12.w),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(m.name, style: textTheme.titleSmall?.copyWith(fontSize: 14.sp, fontWeight: FontWeight.bold, color: colors.brandNavy)),
                  SizedBox(height: 2.h),
                  Text(m.subtitle, style: textTheme.labelSmall?.copyWith(fontSize: 11.sp, color: colors.secondaryText)),
                ])),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                  decoration: BoxDecoration(color: badgeBg, borderRadius: BorderRadius.circular(20.r)),
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    Container(width: 6.r, height: 6.r, decoration: BoxDecoration(color: badgeColor, shape: BoxShape.circle)),
                    SizedBox(width: 5.w),
                    Text(m.isPending ? s.pendingStatusBadge : s.activeStatusBadge, style: textTheme.labelSmall?.copyWith(fontSize: 10.5.sp, fontWeight: FontWeight.bold, color: badgeColor)),
                  ]),
                ),
              ]),
              SizedBox(height: 8.h),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: InkWell(
                  onTap: () => onEndLink(i),
                  child: Text(s.endLinkAction, style: textTheme.labelSmall?.copyWith(fontSize: 11.sp, fontWeight: FontWeight.bold, color: AppColors.heartRateRed)),
                ),
              ),
            ]),
          );
        }),
      ],
    );
  }
}
