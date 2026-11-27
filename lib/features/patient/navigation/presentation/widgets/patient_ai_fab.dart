import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';
import 'package:haya_care/core/widgets/tap_scale_widget.dart';

class PatientAiFab extends StatefulWidget {
  final VoidCallback? onTap;

  const PatientAiFab({super.key, this.onTap});

  @override
  State<PatientAiFab> createState() => _PatientAiFabState();
}

class _PatientAiFabState extends State<PatientAiFab>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _ringScale;
  late final Animation<double> _ringOpacity;
  late final Animation<double> _heartScale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat();
    _ringScale = Tween<double>(begin: 1.0, end: 1.42).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.75, curve: Curves.easeOutCubic),
    ));
    _ringOpacity = Tween<double>(begin: 0.45, end: 0.0).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.75, curve: Curves.easeOut),
    ));
    _heartScale = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.16), weight: 15),
      TweenSequenceItem(tween: Tween(begin: 1.16, end: 0.96), weight: 15),
      TweenSequenceItem(tween: Tween(begin: 0.96, end: 1.1), weight: 15),
      TweenSequenceItem(tween: Tween(begin: 1.1, end: 1.0), weight: 15),
      TweenSequenceItem(tween: ConstantTween(1.0), weight: 40),
    ]).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colors = context.appColors;

    return TapScaleWidget(
      scale: 0.92,
      onTap: () {
        HapticFeedback.lightImpact();
        widget.onTap?.call();
      },
      child: SizedBox(
        width: 58.r,
        height: 58.r,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (_, _) => Transform.scale(
                scale: _ringScale.value,
                child: Container(
                  width: 54.r,
                  height: 54.r,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18.r),
                    border: Border.all(
                      color: AppColors.primaryBlue
                          .withValues(alpha: _ringOpacity.value),
                      width: 2.2,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: 54.r,
              height: 54.r,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.splashBackground, AppColors.primaryBlue],
                  begin: AlignmentDirectional.topStart,
                  end: AlignmentDirectional.bottomEnd,
                ),
                borderRadius: BorderRadius.circular(18.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryBlue.withValues(alpha: 0.36),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: ScaleTransition(
                scale: _heartScale,
                child: Icon(
                  Icons.favorite_border_rounded,
                  color: AppColors.white,
                  size: 25.sp,
                ),
              ),
            ),
            PositionedDirectional(
              top: -3.h,
              end: -3.w,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: AppColors.splashBackground,
                  borderRadius: BorderRadius.circular(6.r),
                  border: Border.all(color: colors.cardBackground, width: 1.5),
                ),
                child: Text(
                  'AI',
                  style: textTheme.labelSmall?.copyWith(
                    fontSize: 8.5.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                    height: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
