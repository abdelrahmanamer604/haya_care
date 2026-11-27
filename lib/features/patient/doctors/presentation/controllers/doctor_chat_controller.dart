import 'package:flutter/material.dart';
import 'package:haya_care/features/patient/doctors/data/models/chat_message_model.dart';

class DoctorChatController extends ChangeNotifier {
  final List<ChatMessageModel> _messages = [];
  bool _initialized = false;

  List<ChatMessageModel> get messages => List.unmodifiable(_messages);

  void initIfNeeded(List<ChatMessageModel> initialMessages) {
    if (_initialized) return;
    _messages.addAll(initialMessages);
    _initialized = true;
  }

  void sendTextMessage(String text, String timeLabel) {
    final trimmed = text.trim();
    if (trimmed.isEmpty) return;
    _messages.add(
      ChatMessageModel(
        id: 'm_${DateTime.now().microsecondsSinceEpoch}',
        isFromPatient: true,
        type: ChatMessageType.text,
        text: trimmed,
        time: timeLabel,
      ),
    );
    notifyListeners();
  }

  void sendVitalCard({
    required String title,
    required String value,
    required String status,
    required String time,
  }) {
    _messages.add(
      ChatMessageModel(
        id: 'v_${DateTime.now().microsecondsSinceEpoch}',
        isFromPatient: true,
        type: ChatMessageType.vitalReading,
        text: '',
        time: time,
        vitalTitle: title,
        vitalValue: value,
        vitalStatus: status,
      ),
    );
    notifyListeners();
  }
}
