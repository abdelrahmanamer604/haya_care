import 'package:haya_care/features/patient/doctors/data/models/chat_message_model.dart';
import 'package:haya_care/l10n/app_localizations.dart';

List<ChatMessageModel> getDemoDoctorChatMessages(S s) {
  return [
    ChatMessageModel(
      id: 'm1',
      isFromPatient: false,
      type: ChatMessageType.text,
      text: s.chatDemoDoctorMsg,
      time: s.chatDemoDoctorTime,
    ),
    ChatMessageModel(
      id: 'm2',
      isFromPatient: true,
      type: ChatMessageType.text,
      text: s.chatDemoPatientMsg,
      time: s.chatDemoPatientTime,
    ),
    ChatMessageModel(
      id: 'm3',
      isFromPatient: true,
      type: ChatMessageType.vitalReading,
      text: '',
      time: s.chatDemoVitalTime,
      vitalTitle: s.bloodPressure,
      vitalValue: s.chatReadingValue,
      vitalStatus: s.normalStatus,
    ),
  ];
}
