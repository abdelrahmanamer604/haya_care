import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/app_feedback.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/core/widgets/tap_scale_widget.dart';
import 'package:haya_care/features/patient/home/presentation/controllers/home_sos_controller.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class HomeSosCard extends StatefulWidget {
  const HomeSosCard({super.key});

  @override
  State<HomeSosCard> createState() => _HomeSosCardState();
}

class _HomeSosCardState extends State<HomeSosCard> {
  final HomeSosController _controller = HomeSosController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _onTapSos(S s) async {
    if (_controller.isCoolingDown) return;
    HapticFeedback.heavyImpact();
    final confirmed = await AppFeedback.showConfirmDialog(
      context,
      title: s.sosConfirmTitle,
      message: s.sosConfirmMessage,
      confirmLabel: s.sosButton,
      cancelLabel: s.cancelButton,
      confirmColor: AppColors.heartRateRed,
    );
    if (!confirmed || !mounted) return;
    _controller.triggerSos();
    AppFeedback.showError(context, s.sosSentSuccess);
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final colors = context.appColors;
    final textTheme = context.textTheme;

    return ListenableBuilder(
      listenable: _controller,
      builder: (context, _) {
        final cooling = _controller.isCoolingDown;
        return Container(
          padding: EdgeInsets.all(14.r),
          decoration: BoxDecoration(
            color: colors.redSurface.withValues(alpha: 0.45),
            borderRadius: BorderRadius.circular(18.r),
            border: Border.all(color: AppColors.heartRateRed.withValues(alpha: 0.28)),
          ),
          child: Row(
            children: [
              Container(
                width: 42.r,
                height: 42.r,
                decoration: BoxDecoration(
                  color: AppColors.heartRateRed,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                alignment: Alignment.center,
                child: Icon(Icons.emergency_outlined, color: AppColors.white, size: 22.sp),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(s.sosTitle,
                        style: textTheme.titleSmall?.copyWith(fontSize: 13.5.sp, fontWeight: FontWeight.bold, color: AppColors.heartRateRed)),
                    SizedBox(height: 2.h),
                    Text(s.sosSubtitle,
                        style: textTheme.labelSmall?.copyWith(fontSize: 10.5.sp, color: colors.secondaryText)),
                  ],
                ),
              ),
              SizedBox(width: 8.w),
              TapScaleWidget(
                scale: 0.95,
                onTap: cooling ? null : () => _onTapSos(s),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    color: cooling ? colors.borderColor : AppColors.heartRateRed,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Text(
                    cooling ? s.sosCooldownLabel(_controller.cooldownSeconds) : s.sosButton,
                    style: textTheme.labelSmall?.copyWith(
                      fontSize: 11.5.sp,
                      fontWeight: FontWeight.bold,
                      color: cooling ? colors.secondaryText : AppColors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
