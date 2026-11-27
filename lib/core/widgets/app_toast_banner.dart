import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/theme/app_colors.dart';
import 'package:haya_care/core/utils/extensions.dart';

class AppToastBanner extends StatefulWidget {
  final String message;
  final IconData icon;
  final Color backgroundColor;
  final VoidCallback onDismissed;

  const AppToastBanner({
    super.key,
    required this.message,
    required this.icon,
    required this.backgroundColor,
    required this.onDismissed,
  });

  @override
  State<AppToastBanner> createState() => _AppToastBannerState();
}

class _AppToastBannerState extends State<AppToastBanner>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacity;
  late final Animation<Offset> _offset;
  bool _dismissing = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 220),
    );
    _opacity = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _offset = Tween<Offset>(begin: const Offset(0, 0.35), end: Offset.zero)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
    _controller.forward();
    Future.delayed(const Duration(milliseconds: 2200), _dismiss);
  }

  Future<void> _dismiss() async {
    if (_dismissing || !mounted) return;
    _dismissing = true;
    await _controller.reverse();
    if (mounted) widget.onDismissed();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.viewInsetsOf(context).bottom;
    return Positioned(
      left: 16.w,
      right: 16.w,
      bottom: bottomInset + 24.h,
      child: Material(
        color: AppColors.transparent,
        child: FadeTransition(
          opacity: _opacity,
          child: SlideTransition(
            position: _offset,
            child: GestureDetector(
              onTap: _dismiss,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 13.h),
                decoration: BoxDecoration(
                  color: widget.backgroundColor,
                  borderRadius: BorderRadius.circular(14.r),
                  boxShadow: const [
                    BoxShadow(color: AppColors.shadowColor, blurRadius: 16, offset: Offset(0, 6)),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(widget.icon, color: AppColors.white, size: 18.sp),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Text(
                        widget.message,
                        style: context.textTheme.labelMedium?.copyWith(
                          color: AppColors.white,
                          fontSize: 12.5.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
