import 'package:flutter/foundation.dart';
import 'package:haya_care/features/patient/ai_assistant/data/ai_assistant_demo_data.dart';
import 'package:haya_care/features/patient/ai_assistant/presentation/widgets/ai_assistant_messages.dart';
import 'package:haya_care/l10n/app_localizations.dart';

class AiAssistantController extends ChangeNotifier {
  final List<AiChatEntry> messages = [];
  bool shareHealthData = false;
  bool _initialized = false;

  void initIfNeeded(S s) {
    if (_initialized) return;
    messages.add(AiChatEntry(text: s.aiWelcomeMessage, isUser: false));
    _initialized = true;
  }

  void setShareHealthData(bool value) {
    if (shareHealthData == value) return;
    shareHealthData = value;
    notifyListeners();
  }

  bool sendPrompt(String rawText, S s) {
    final text = rawText.trim();
    if (text.isEmpty) return false;
    messages.add(AiChatEntry(text: text, isUser: true));
    messages.add(AiChatEntry(
      text: resolveAiAssistantReply(text, s, shareHealthData: shareHealthData),
      isUser: false,
    ));
    notifyListeners();
    return true;
  }

  void clearChat(S s) {
    messages
      ..clear()
      ..add(AiChatEntry(text: s.aiWelcomeMessage, isUser: false));
    notifyListeners();
  }
}
