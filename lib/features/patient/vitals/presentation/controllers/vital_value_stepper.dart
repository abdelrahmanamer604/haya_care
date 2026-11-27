import 'package:flutter/material.dart';

class VitalValueStepper {
  VitalValueStepper._();

  static void step(
    TextEditingController controller, {
    required String fallbackHint,
    required int direction,
    required bool decimal,
  }) {
    final raw = controller.text.trim();
    final base = double.tryParse(raw) ?? double.tryParse(fallbackHint) ?? 0;
    final stepSize = decimal ? 0.5 : 1.0;
    final next = (base + (direction * stepSize)).clamp(0.0, 999.0);
    controller.text = decimal ? next.toStringAsFixed(1) : next.round().toString();
    controller.selection = TextSelection.fromPosition(
      TextPosition(offset: controller.text.length),
    );
  }
}
