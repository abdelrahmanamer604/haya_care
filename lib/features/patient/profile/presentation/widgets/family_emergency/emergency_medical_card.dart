import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/features/patient/profile/presentation/widgets/family_emergency/emergency_card_parts.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class EmergencyMedicalCard extends StatelessWidget {
  final String allergy;
  final String contactName;
  final String phone;
  final VoidCallback onViewFullCard;
  final VoidCallback onShareTap;
  final VoidCallback onEditTap;

  const EmergencyMedicalCard({
    super.key,
    required this.allergy,
    required this.contactName,
    required this.phone,
    required this.onViewFullCard,
    required this.onShareTap,
    required this.onEditTap,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final textTheme = context.textTheme;
    final line = AppColors.white.withValues(alpha: 0.14);

    return Container(
      decoration: BoxDecoration(
        color: AppColors.splashBackground,
        borderRadius: BorderRadius.circular(22.r),
        boxShadow: const [BoxShadow(color: AppColors.shadowColor, blurRadius: 14, offset: Offset(0, 4))],
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(18.w, 16.h, 18.w, 14.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(mainAxisSize: MainAxisSize.min, children: [
                      Icon(Icons.favorite_border_rounded, color: AppColors.white, size: 16.sp),
                      SizedBox(width: 6.w),
                      Text(s.emergencyMedicalCardTitle, style: textTheme.labelMedium?.copyWith(fontSize: 11.5.sp, color: AppColors.white)),
                    ]),
                    Row(mainAxisSize: MainAxisSize.min, children: [
                      Icon(Icons.favorite_border_rounded, color: AppColors.orangeBadge, size: 16.sp),
                      SizedBox(width: 4.w),
                      RichText(
                        text: TextSpan(
                          style: textTheme.labelMedium?.copyWith(fontSize: 13.5.sp, fontWeight: FontWeight.bold, color: AppColors.white),
                          children: [
                            const TextSpan(text: 'Haya'),
                            TextSpan(text: 'Care', style: textTheme.labelMedium?.copyWith(fontSize: 13.5.sp, fontWeight: FontWeight.bold, color: AppColors.orangeBadge)),
                          ],
                        ),
                      ),
                    ]),
                  ],
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Container(
                      width: 54.r,
                      height: 54.r,
                      decoration: BoxDecoration(color: AppColors.onboardingPeach, borderRadius: BorderRadius.circular(14.r)),
                      alignment: Alignment.center,
                      child: Text(s.profileDemoInitials, style: textTheme.titleMedium?.copyWith(fontSize: 18.sp, fontWeight: FontWeight.bold, color: AppColors.splashBackground)),
                    ),
                    SizedBox(width: 14.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(s.fullNameLabel, style: textTheme.labelSmall?.copyWith(fontSize: 10.sp, color: AppColors.splashSubtitleText)),
                          SizedBox(height: 2.h),
                          Text(s.profileDemoName, style: textTheme.titleMedium?.copyWith(fontSize: 16.sp, fontWeight: FontWeight.bold, color: AppColors.white)),
                          SizedBox(height: 4.h),
                          Row(children: [
                            Text(s.bloodTypeLabel, style: textTheme.labelSmall?.copyWith(fontSize: 10.5.sp, color: AppColors.splashSubtitleText)),
                            SizedBox(width: 8.w),
                            Text(s.bloodTypeOPlus, style: textTheme.labelMedium?.copyWith(fontSize: 13.sp, fontWeight: FontWeight.bold, color: AppColors.orangeBadge)),
                          ]),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 14.h),
                EmergencyCardInfoRow(label: s.knownConditionsLabel, value: s.knownConditionsValue, line: line),
                EmergencyCardInfoRow(label: s.allergiesTitle, value: allergy, line: line),
                EmergencyCardInfoRow(label: s.importantMedsLabel, value: s.importantMedsValue, line: line),
                EmergencyCardInfoRow(label: s.emergencyContactShortLabel, value: '$contactName · $phone', line: null),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.white.withValues(alpha: 0.06),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(22.r)),
              border: Border(top: BorderSide(color: line)),
            ),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(child: EmergencyCardActionBtn(icon: Icons.visibility_outlined, label: s.viewFullCard, onTap: onViewFullCard)),
                  VerticalDivider(width: 1, color: line),
                  Expanded(child: EmergencyCardActionBtn(icon: context.forwardChevron, label: s.shareAction, onTap: onShareTap)),
                  VerticalDivider(width: 1, color: line),
                  Expanded(child: EmergencyCardActionBtn(icon: Icons.description_outlined, label: s.editAction, onTap: onEditTap)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
