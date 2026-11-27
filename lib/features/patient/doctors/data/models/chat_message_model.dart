enum ChatMessageType { text, vitalReading }

class ChatMessageModel {
  final String id;
  final bool isFromPatient;
  final ChatMessageType type;
  final String text;
  final String time;
  final String? vitalTitle;
  final String? vitalValue;
  final String? vitalStatus;

  const ChatMessageModel({
    required this.id,
    required this.isFromPatient,
    required this.type,
    required this.text,
    required this.time,
    this.vitalTitle,
    this.vitalValue,
    this.vitalStatus,
  });
}
