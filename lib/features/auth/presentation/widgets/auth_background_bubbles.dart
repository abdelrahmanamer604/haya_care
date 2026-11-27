import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haya_care/core/utils/extensions.dart';

class AuthBackgroundBubbles extends StatefulWidget {
  final Widget child;

  const AuthBackgroundBubbles({super.key, required this.child});

  @override
  State<AuthBackgroundBubbles> createState() => _AuthBackgroundBubblesState();
}

class _AuthBackgroundBubblesState extends State<AuthBackgroundBubbles>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _floatAnim;
  late final Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3800),
    )..repeat(reverse: true);

    _floatAnim = Tween<double>(begin: -10, end: 10).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutSine),
    );
    _scaleAnim = Tween<double>(begin: 0.96, end: 1.05).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutSine),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bubbleColor = context.appColors.orangeSurface.withValues(alpha: 0.55);

    return Stack(
      children: [
        // Top-end floating bubble
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return PositionedDirectional(
              top: -55.r + _floatAnim.value,
              end: -55.r,
              child: Transform.scale(
                scale: _scaleAnim.value,
                child: child,
              ),
            );
          },
          child: Container(
            width: 190.r,
            height: 190.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: bubbleColor,
            ),
          ),
        ),
        // Bottom-start floating bubble
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return PositionedDirectional(
              bottom: -65.r - _floatAnim.value,
              start: -60.r,
              child: Transform.scale(
                scale: 2.01 - _scaleAnim.value,
                child: child,
              ),
            );
          },
          child: Container(
            width: 210.r,
            height: 210.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: bubbleColor,
            ),
          ),
        ),
        widget.child,
      ],
    );
  }
}
