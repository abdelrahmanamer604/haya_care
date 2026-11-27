import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';

/// Reusable animated empty state placeholder.
/// TODO: Replace the icon animation inside [_buildVisual] with a Lottie asset later.
class EmptyStateWidget extends StatefulWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String? actionLabel;
  final VoidCallback? onAction;

  const EmptyStateWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.actionLabel,
    this.onAction,
  });

  @override
  State<EmptyStateWidget> createState() => _EmptyStateWidgetState();
}

class _EmptyStateWidgetState extends State<EmptyStateWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _floatOffset;
  late final Animation<double> _pulseScale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2200),
    )..repeat(reverse: true);

    _floatOffset = Tween<double>(begin: -5, end: 5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutSine),
    );
    _pulseScale = Tween<double>(begin: 0.96, end: 1.06).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
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

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 36.h, horizontal: 16.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // TODO: Replace with Lottie.asset('assets/animations/empty_state.json')
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, _floatOffset.value),
                child: Transform.scale(
                  scale: _pulseScale.value,
                  child: child,
                ),
              );
            },
            child: Container(
              width: 82.r,
              height: 82.r,
              decoration: BoxDecoration(
                color: colors.orangeSurface,
                borderRadius: BorderRadius.circular(24.r),
              ),
              alignment: Alignment.center,
              child: Icon(
                widget.icon,
                size: 36.sp,
                color: colors.brandNavy,
              ),
            ),
          ),
          SizedBox(height: 18.h),
          Text(
            widget.title,
            textAlign: TextAlign.center,
            style: textTheme.titleMedium?.copyWith(
              fontSize: 17.sp,
              fontWeight: FontWeight.bold,
              color: colors.brandNavy,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            widget.subtitle,
            textAlign: TextAlign.center,
            style: textTheme.bodySmall?.copyWith(
              fontSize: 12.5.sp,
              color: colors.secondaryText,
            ),
          ),
          if (widget.actionLabel != null && widget.onAction != null) ...[
            SizedBox(height: 14.h),
            TextButton(
              onPressed: widget.onAction,
              style: TextButton.styleFrom(
                backgroundColor: colors.orangeSurface,
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ),
              child: Text(
                widget.actionLabel!,
                style: textTheme.labelMedium?.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.orangeBadge,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
