import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/core/utils/responsive.dart';
import 'package:haya_care/core/widgets/empty_state_widget.dart';
import 'package:haya_care/features/patient/notifications/presentation/controllers/patient_notifications_controller.dart';
import 'package:haya_care/features/patient/notifications/presentation/widgets/notification_item_card.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class PatientNotificationsScreen extends StatefulWidget {
  const PatientNotificationsScreen({super.key});

  @override
  State<PatientNotificationsScreen> createState() =>
      _PatientNotificationsScreenState();
}

class _PatientNotificationsScreenState
    extends State<PatientNotificationsScreen> {
  final PatientNotificationsController _controller =
      PatientNotificationsController();

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
    final theme = context.theme;
    final textTheme = context.textTheme;
    final colors = context.appColors;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: AdaptiveScaffoldWrapper(
          maxContentWidth: 440,
          child: ListenableBuilder(
            listenable: _controller,
            builder: (context, _) => SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      width: 42.r,
                      height: 42.r,
                      decoration: BoxDecoration(
                        color: theme.cardTheme.color,
                        borderRadius: BorderRadius.circular(14.r),
                        boxShadow: const [BoxShadow(color: AppColors.shadowColor, blurRadius: 10, offset: Offset(0, 2))],
                      ),
                      alignment: Alignment.center,
                      child: Icon(context.backChevron, color: colors.primaryText, size: 22.sp),
                    ),
                  ),
                  SizedBox(height: 18.h),
                  Text(s.notificationsTitle, style: textTheme.headlineMedium?.copyWith(fontSize: 26.sp, fontWeight: FontWeight.bold, color: colors.brandNavy)),
                  SizedBox(height: 4.h),
                  Text(s.notificationsSubtitle, style: textTheme.bodySmall?.copyWith(fontSize: 13.sp)),
                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      TextButton.icon(
                        onPressed: _controller.markAllRead,
                        icon: Icon(Icons.done_all_rounded, size: 16.sp, color: colors.brandNavy),
                        label: Text(s.markAllReadAction, style: textTheme.labelSmall?.copyWith(fontSize: 11.5.sp, fontWeight: FontWeight.bold, color: colors.brandNavy)),
                      ),
                      SizedBox(width: 8.w),
                      TextButton.icon(
                        onPressed: _controller.clearRead,
                        icon: Icon(Icons.delete_sweep_outlined, size: 16.sp, color: AppColors.orangeBadge),
                        label: Text(s.deleteReadAction, style: textTheme.labelSmall?.copyWith(fontSize: 11.5.sp, fontWeight: FontWeight.bold, color: AppColors.orangeBadge)),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  if (_controller.items.isEmpty)
                    EmptyStateWidget(icon: Icons.notifications_none_rounded, title: s.notificationsTitle, subtitle: s.notificationsSubtitle)
                  else
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _controller.items.length,
                      separatorBuilder: (_, _) => SizedBox(height: 12.h),
                      itemBuilder: (context, index) => NotificationItemCard(item: _controller.items[index]),
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
