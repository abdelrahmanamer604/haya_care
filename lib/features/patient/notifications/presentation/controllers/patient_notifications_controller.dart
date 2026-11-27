import 'package:flutter/foundation.dart';
import 'package:haya_care/features/patient/notifications/data/notifications_demo_data.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class PatientNotificationsController extends ChangeNotifier {
  final List<NotificationItemData> items = [];
  bool _initialized = false;

  void initIfNeeded(S s) {
    if (_initialized) return;
    items.addAll(getNotificationsDemoItems(s));
    _initialized = true;
  }

  void markAllRead() {
    for (var i = 0; i < items.length; i++) {
      final item = items[i];
      if (!item.isUnread) continue;
      items[i] = NotificationItemData(
        title: item.title,
        body: item.body,
        time: item.time,
        icon: item.icon,
        isOrange: item.isOrange,
        isUnread: false,
      );
    }
    notifyListeners();
  }

  void clearRead() {
    items.removeWhere((item) => !item.isUnread);
    notifyListeners();
  }
}
