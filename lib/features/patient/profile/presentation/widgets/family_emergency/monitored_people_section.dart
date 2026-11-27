import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/features/patient/profile/data/models/monitored_patient_model.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class MonitoredPeopleSection extends StatelessWidget {
  final List<MonitoredPatientModel> people;
  final ValueChanged<int> onAccept;
  final ValueChanged<int> onDeclineOrEnd;
  final ValueChanged<int> onViewSummary;

  const MonitoredPeopleSection({
    super.key,
    required this.people,
    required this.onAccept,
    required this.onDeclineOrEnd,
    required this.onViewSummary,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final colors = context.appColors;
    if (people.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(s.monitoredPeopleTitle, style: context.textTheme.titleMedium?.copyWith(color: colors.brandNavy, fontWeight: FontWeight.bold)),
        SizedBox(height: 2.h),
        Text(s.monitoredPeopleSubtitle, style: context.textTheme.bodySmall?.copyWith(color: colors.secondaryText)),
        SizedBox(height: 10.h),
        ...List.generate(people.length, (i) => _buildCard(context, s, people[i], i)),
      ],
    );
  }

  Widget _buildCard(BuildContext context, S s, MonitoredPatientModel item, int index) {
    final colors = context.appColors;
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(color: colors.cardBackground, borderRadius: BorderRadius.circular(16.r), border: Border.all(color: colors.borderColor)),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundColor: (item.isPending ? AppColors.warningAmber : AppColors.primaryBlue).withValues(alpha: 0.14),
                child: Text(item.initials, style: context.textTheme.labelLarge?.copyWith(color: item.isPending ? AppColors.warningAmber : AppColors.primaryBlue, fontWeight: FontWeight.bold)),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.name, style: context.textTheme.bodyMedium?.copyWith(color: colors.brandNavy, fontWeight: FontWeight.bold)),
                    Text(item.isPending ? s.incomingInviteBadge : s.readOnlyBadge, style: context.textTheme.bodySmall?.copyWith(color: item.isPending ? AppColors.warningAmber : colors.secondaryText)),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          if (item.isPending)
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => onDeclineOrEnd(index),
                    child: Text(s.declineInviteButton, style: context.textTheme.labelMedium?.copyWith(color: AppColors.heartRateRed)),
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => onAccept(index),
                    style: ElevatedButton.styleFrom(backgroundColor: AppColors.splashBackground, foregroundColor: AppColors.white),
                    child: Text(s.acceptInviteButton, style: context.textTheme.labelMedium?.copyWith(color: AppColors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            )
          else
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => onViewSummary(index),
                    icon: Icon(Icons.visibility_outlined, size: 16.sp, color: AppColors.white),
                    label: Text(s.viewSummaryButton, style: context.textTheme.labelMedium?.copyWith(color: AppColors.white, fontWeight: FontWeight.bold)),
                    style: ElevatedButton.styleFrom(backgroundColor: AppColors.splashBackground, foregroundColor: AppColors.white),
                  ),
                ),
                SizedBox(width: 8.w),
                TextButton(
                  onPressed: () => onDeclineOrEnd(index),
                  child: Text(s.endLinkAction, style: context.textTheme.labelSmall?.copyWith(color: AppColors.heartRateRed, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
