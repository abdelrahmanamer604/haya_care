import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/theme/app_theme.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/core/widgets/tap_scale_widget.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class HomeQuickAccessSection extends StatelessWidget {
  final VoidCallback? onMedicationsTap;
  final VoidCallback? onReportsTap;

  const HomeQuickAccessSection({
    super.key,
    this.onMedicationsTap,
    this.onReportsTap,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final theme = context.theme;
    final textTheme = context.textTheme;
    final colors = context.appColors;
    final isRtl = context.isRtl;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          s.quickAccessTitle,
          style: textTheme.labelMedium?.copyWith(
            fontSize: 17.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 2.h),
        Text(
          s.quickAccessSubtitle,
          style: textTheme.labelSmall?.copyWith(fontSize: 11.sp),
        ),
        SizedBox(height: 12.h),
        _buildQuickCard(
          theme: theme,
          textTheme: textTheme,
          isRtl: isRtl,
          title: s.medicationsNav,
          subtitle: s.medicationsSubtitle,
          icon: Icons.medication_outlined,
          iconColor: AppColors.orangeBadge,
          iconBgColor: colors.orangeSurface,
          onTap: onMedicationsTap,
        ),
        SizedBox(height: 10.h),
        _buildQuickCard(
          theme: theme,
          textTheme: textTheme,
          isRtl: isRtl,
          title: s.medicalReportsTitle,
          subtitle: s.medicalReportsSubtitle,
          icon: Icons.description_outlined,
          iconColor: colors.brandNavy,
          iconBgColor: colors.navySurface,
          onTap: onReportsTap,
        ),
      ],
    );
  }

  Widget _buildQuickCard({
    required ThemeData theme,
    required TextTheme textTheme,
    required bool isRtl,
    required String title,
    required String subtitle,
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
    VoidCallback? onTap,
  }) {
    return TapScaleWidget(
      onTap: onTap,
      scale: 1.02,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: theme.cardTheme.color,
          borderRadius: BorderRadius.circular(18.r),
          boxShadow: const [
            BoxShadow(
              color: AppColors.shadowColor,
              blurRadius: 12,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 44.r,
              height: 44.r,
              decoration: BoxDecoration(
                color: iconBgColor,
                borderRadius: BorderRadius.circular(13.r),
              ),
              alignment: Alignment.center,
              child: Icon(icon, color: iconColor, size: 22.sp),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: textTheme.labelMedium?.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    subtitle,
                    style: textTheme.labelSmall?.copyWith(fontSize: 11.sp),
                  ),
                ],
              ),
            ),
            Icon(
              isRtl ? Icons.chevron_left_rounded : Icons.chevron_right_rounded,
              color: theme.extension<AppThemeColors>()!.secondaryText,
              size: 22.sp,
            ),
          ],
        ),
      ),
    );
  }
}
