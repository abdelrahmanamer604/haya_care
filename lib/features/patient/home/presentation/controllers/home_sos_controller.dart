import 'dart:async';
import 'package:flutter/foundation.dart';

class HomeSosController extends ChangeNotifier {
  int cooldownSeconds = 0;
  Timer? _timer;

  bool get isCoolingDown => cooldownSeconds > 0;

  void triggerSos() {
    if (isCoolingDown) return;
    cooldownSeconds = 120;
    notifyListeners();
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (cooldownSeconds <= 1) {
        cooldownSeconds = 0;
        timer.cancel();
      } else {
        cooldownSeconds--;
      }
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
