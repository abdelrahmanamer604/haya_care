import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/routing/routes.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/app_feedback.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/core/utils/responsive.dart';
import 'package:haya_care/core/widgets/app_button.dart';
import 'package:haya_care/core/widgets/tap_scale_widget.dart';
import 'package:haya_care/features/patient/doctors/data/models/doctor_model.dart';
import 'package:haya_care/features/patient/doctors/presentation/widgets/doctor_profile_info_cards.dart';
import 'package:haya_care/features/patient/doctors/presentation/widgets/doctor_profile_summary_card.dart';
import 'package:haya_care/features/patient/doctors/presentation/widgets/doctor_rating_dialog.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class DoctorProfileScreen extends StatefulWidget {
  final DoctorModel doctor;
  const DoctorProfileScreen({super.key, required this.doctor});

  @override
  State<DoctorProfileScreen> createState() => _DoctorProfileScreenState();
}

class _DoctorProfileScreenState extends State<DoctorProfileScreen> {
  DoctorCareStatus _status = DoctorCareStatus.none;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final colors = context.appColors;
    final textTheme = context.textTheme;
    final (statusLabel, statusColor, statusBg) = switch (_status) {
      DoctorCareStatus.none => (s.relationNone, colors.secondaryText, colors.inputBackground),
      DoctorCareStatus.pending => (s.relationPending, AppColors.warningAmber, colors.warningSurface),
      DoctorCareStatus.active => (s.relationActive, AppColors.successGreen, colors.greenSurface),
    };

    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: AdaptiveScaffoldWrapper(
          maxContentWidth: 440,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.fromLTRB(20.w, 14.h, 20.w, 28.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TapScaleWidget(
                  scale: 0.94,
                  onTap: () => context.pop(),
                  child: Container(
                    width: 42.r,
                    height: 42.r,
                    decoration: BoxDecoration(color: colors.cardBackground, borderRadius: BorderRadius.circular(14.r), boxShadow: const [BoxShadow(color: AppColors.shadowColor, blurRadius: 10, offset: Offset(0, 2))]),
                    alignment: Alignment.center,
                    child: Icon(context.backChevron, color: colors.primaryText, size: 22.sp),
                  ),
                ),
                SizedBox(height: 16.h),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Text(s.doctorProfileTitle, style: textTheme.headlineMedium?.copyWith(fontSize: 24.sp, fontWeight: FontWeight.bold, color: colors.brandNavy)),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                    decoration: BoxDecoration(color: statusBg, borderRadius: BorderRadius.circular(20.r)),
                    child: Text(statusLabel, style: textTheme.labelSmall?.copyWith(fontSize: 10.5.sp, fontWeight: FontWeight.bold, color: statusColor)),
                  ),
                ]),
                SizedBox(height: 16.h),
                DoctorProfileSummaryCard(doctor: widget.doctor),
                SizedBox(height: 14.h),
                DoctorProfileInfoCards(doctor: widget.doctor),
                SizedBox(height: 20.h),
                AppButton(
                  text: s.requestFollowUp,
                  leadingIcon: Icons.medical_information_outlined,
                  onPressed: () {
                    setState(() => _status = DoctorCareStatus.pending);
                    AppFeedback.showSuccess(context, s.followUpRequestedMsg(widget.doctor.name));
                  },
                ),
                SizedBox(height: 12.h),
                AppButton(
                  text: s.sendMessage,
                  variant: AppButtonVariant.outlined,
                  leadingIcon: Icons.mail_outline_rounded,
                  onPressed: () => context.pushNamed(Routes.doctorChat, arguments: widget.doctor),
                ),
                SizedBox(height: 10.h),
                Center(
                  child: TextButton.icon(
                    onPressed: () async {
                      final stars = await showDoctorRatingDialog(context, widget.doctor.name);
                      if (stars != null && context.mounted) {
                        AppFeedback.showSuccess(context, s.ratingSubmittedSuccess);
                      }
                    },
                    icon: Icon(Icons.star_outline_rounded, color: AppColors.warningAmber, size: 18.sp),
                    label: Text(s.rateDoctorButton, style: textTheme.labelMedium?.copyWith(fontSize: 12.5.sp, fontWeight: FontWeight.bold, color: colors.brandNavy)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
