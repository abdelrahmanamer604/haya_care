import 'package:flutter/material.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class NotificationItemData {
  final String title;
  final String body;
  final String time;
  final IconData icon;
  final bool isOrange;
  final bool isUnread;

  const NotificationItemData({
    required this.title,
    required this.body,
    required this.time,
    required this.icon,
    required this.isOrange,
    required this.isUnread,
  });
}

List<NotificationItemData> getNotificationsDemoItems(S s) => [
      NotificationItemData(
        title: s.notifMedTitle,
        body: s.notifMedBody,
        time: s.notifMedTime,
        icon: Icons.medication_outlined,
        isOrange: true,
        isUnread: true,
      ),
      NotificationItemData(
        title: s.notifBpTitle,
        body: s.notifBpBody,
        time: s.notifBpTime,
        icon: Icons.monitor_heart_outlined,
        isOrange: false,
        isUnread: true,
      ),
      NotificationItemData(
        title: s.notifWeightTitle,
        body: s.notifWeightBody,
        time: s.notifWeightTime,
        icon: Icons.person_outline_rounded,
        isOrange: false,
        isUnread: false,
      ),
      NotificationItemData(
        title: s.notifHrTitle,
        body: s.notifHrBody,
        time: s.notifHrTime,
        icon: Icons.favorite_border_rounded,
        isOrange: true,
        isUnread: false,
      ),
      NotificationItemData(
        title: s.notifMsgTitle,
        body: s.notifMsgBody,
        time: s.notifMsgTime,
        icon: Icons.mail_outline_rounded,
        isOrange: false,
        isUnread: false,
      ),
      NotificationItemData(
        title: s.notifApptTitle,
        body: s.notifApptBody,
        time: s.notifApptTime,
        icon: Icons.calendar_today_outlined,
        isOrange: true,
        isUnread: false,
      ),
    ];
