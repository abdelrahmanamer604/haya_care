import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/core/utils/responsive.dart';
import 'package:haya_care/features/patient/profile/data/models/monitored_patient_model.dart';
import 'package:haya_care/features/patient/profile/presentation/widgets/shared/profile_sub_header.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class CaregiverPatientSummaryScreen extends StatelessWidget {
  final MonitoredPatientModel patient;

  const CaregiverPatientSummaryScreen({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final colors = context.appColors;
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: SafeArea(
        bottom: false,
        child: AdaptiveScaffoldWrapper(
          maxContentWidth: 440,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.fromLTRB(20.w, 14.h, 20.w, 28.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileSubHeader(title: patient.name, subtitle: s.readOnlyBadge),
                SizedBox(height: 14.h),
                _buildNoticeBanner(context, s),
                SizedBox(height: 18.h),
                Text(s.latestVitalsSummaryTitle, style: context.textTheme.titleSmall?.copyWith(color: colors.brandNavy, fontWeight: FontWeight.bold)),
                SizedBox(height: 10.h),
                ...patient.vitals.map((v) => _buildVitalTile(context, s, v)),
                SizedBox(height: 16.h),
                Text(s.urgentAlertsHistoryTitle, style: context.textTheme.titleSmall?.copyWith(color: colors.brandNavy, fontWeight: FontWeight.bold)),
                SizedBox(height: 10.h),
                _buildAlertsCard(context, s),
                SizedBox(height: 22.h),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () => Navigator.of(context).pop(true),
                    icon: Icon(Icons.link_off_rounded, color: AppColors.heartRateRed, size: 18.sp),
                    label: Text(s.endLinkAction, style: context.textTheme.labelLarge?.copyWith(color: AppColors.heartRateRed, fontWeight: FontWeight.bold)),
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      side: const BorderSide(color: AppColors.heartRateRed),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.r)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNoticeBanner(BuildContext context, S s) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.primaryBlue.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: AppColors.primaryBlue.withValues(alpha: 0.25)),
      ),
      child: Row(
        children: [
          Icon(Icons.visibility_outlined, color: AppColors.primaryBlue, size: 20.sp),
          SizedBox(width: 10.w),
          Expanded(child: Text(s.readOnlyNotice, style: context.textTheme.bodySmall?.copyWith(color: context.appColors.primaryText))),
        ],
      ),
    );
  }

  Widget _buildVitalTile(BuildContext context, S s, MonitoredVitalSummary v) {
    final colors = context.appColors;
    final badgeColor = v.isWatch ? AppColors.warningAmber : AppColors.successGreen;
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      decoration: BoxDecoration(color: colors.cardBackground, borderRadius: BorderRadius.circular(14.r), border: Border.all(color: colors.borderColor)),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(v.label, style: context.textTheme.bodySmall?.copyWith(color: colors.secondaryText)),
                SizedBox(height: 2.h),
                Text('${v.value} ${v.unit}', style: context.textTheme.titleMedium?.copyWith(color: colors.brandNavy, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
            decoration: BoxDecoration(color: badgeColor.withValues(alpha: 0.14), borderRadius: BorderRadius.circular(20.r)),
            child: Text(v.isWatch ? s.statusWatchLabel : s.normalStatus, style: context.textTheme.labelSmall?.copyWith(color: badgeColor, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _buildAlertsCard(BuildContext context, S s) {
    final colors = context.appColors;
    if (patient.urgentAlerts.isEmpty) {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.all(14.w),
        decoration: BoxDecoration(color: colors.cardBackground, borderRadius: BorderRadius.circular(14.r), border: Border.all(color: colors.borderColor)),
        child: Text(s.noUrgentAlertsText, style: context.textTheme.bodySmall?.copyWith(color: colors.secondaryText)),
      );
    }
    return Column(
      children: patient.urgentAlerts
          .map((alert) => Container(
                margin: EdgeInsets.only(bottom: 8.h),
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: AppColors.heartRateRed.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(14.r),
                  border: Border.all(color: AppColors.heartRateRed.withValues(alpha: 0.25)),
                ),
                child: Row(
                  children: [
                    Icon(Icons.warning_amber_rounded, color: AppColors.heartRateRed, size: 20.sp),
                    SizedBox(width: 10.w),
                    Expanded(child: Text(alert, style: context.textTheme.bodySmall?.copyWith(color: colors.primaryText, fontWeight: FontWeight.w600))),
                  ],
                ),
              ))
          .toList(),
    );
  }
}
