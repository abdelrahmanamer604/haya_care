import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';

/// Reusable animated success indicator.
/// TODO: Replace the inner animated icon with a Lottie asset later.
class AnimatedSuccessBadge extends StatefulWidget {
  const AnimatedSuccessBadge({super.key});

  @override
  State<AnimatedSuccessBadge> createState() => _AnimatedSuccessBadgeState();
}

class _AnimatedSuccessBadgeState extends State<AnimatedSuccessBadge>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;
  late final Animation<double> _ringScale;
  late final Animation<double> _ringOpacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..forward();

    _scale = Tween<double>(begin: 0.4, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );
    _ringScale = Tween<double>(begin: 0.85, end: 1.45).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );
    _ringOpacity = Tween<double>(begin: 0.5, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    // TODO: Replace with Lottie.asset('assets/animations/success.json')
    return SizedBox(
      width: 96.r,
      height: 96.r,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (context, _) {
              return Transform.scale(
                scale: _ringScale.value,
                child: Container(
                  width: 68.r,
                  height: 68.r,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(
                      color: AppColors.successGreen
                          .withValues(alpha: _ringOpacity.value),
                      width: 2.5,
                    ),
                  ),
                ),
              );
            },
          ),
          ScaleTransition(
            scale: _scale,
            child: Container(
              width: 68.r,
              height: 68.r,
              decoration: BoxDecoration(
                color: colors.greenSurface,
                borderRadius: BorderRadius.circular(20.r),
              ),
              alignment: Alignment.center,
              child: Icon(
                Icons.check_rounded,
                color: AppColors.successGreen,
                size: 32.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
