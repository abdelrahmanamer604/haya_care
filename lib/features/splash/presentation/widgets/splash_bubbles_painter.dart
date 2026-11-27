import 'package:flutter/material.dart';
import 'package:haya_care/core/theme/app_colors.dart';

class SplashBubblesPainter extends CustomPainter {
  const SplashBubblesPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final strokePaint = Paint()
      ..color = AppColors.splashCircleStroke
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;

    final topCenter = Offset(size.width * 0.9, size.height * 0.05);
    canvas.drawCircle(topCenter, size.width * 0.72, strokePaint);
    canvas.drawCircle(topCenter, size.width * 0.42, strokePaint);

    final bottomCenter = Offset(size.width * 0.1, size.height * 0.92);
    canvas.drawCircle(bottomCenter, size.width * 0.76, strokePaint);
    canvas.drawCircle(bottomCenter, size.width * 0.48, strokePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
