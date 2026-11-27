import 'package:haya_care/l10n/app_localizations.dart';

String resolveAiAssistantReply(
  String text,
  S s, {
  required bool shareHealthData,
}) {
  if (!shareHealthData && _asksAboutPersonalData(text, s)) {
    return s.aiNoDataSharedReply;
  }
  if (text == s.aiChipBpMeaning) return s.aiReplyBpMeaning;
  if (text == s.aiChipNextMed) return s.aiReplyNextMed;
  if (text == s.aiChipGeneralTip) return s.aiReplyGeneralTip;
  return s.aiReplyDefault;
}

bool _asksAboutPersonalData(String text, S s) {
  if (text == s.aiChipBpMeaning || text == s.aiChipNextMed) return true;
  final lower = text.toLowerCase();
  const keywords = [
    'قراء', 'ضغط', 'سكر', 'دواء', 'أدوية', 'جرع', 'وزن', 'نبض', 'أكسجين', 'حرار',
    'reading', 'pressure', 'bp', 'sugar', 'med', 'dose', 'weight', 'heart', 'oxygen', 'temp',
  ];
  return keywords.any(lower.contains);
}
