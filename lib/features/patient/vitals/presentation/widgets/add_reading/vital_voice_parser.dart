import 'package:flutter/material.dart';

class VitalVoiceParseResult {
  final List<String> numbers;
  final int? contextIndex;
  final DateTime? date;
  final TimeOfDay? time;

  const VitalVoiceParseResult({required this.numbers, this.contextIndex, this.date, this.time});
}

class VitalVoiceParser {
  VitalVoiceParser._();

  static String normalizeDigits(String input) {
    const ar = '٠١٢٣٤٥٦٧٨٩';
    const fa = '۰۱۲۳۴۵۶۷۸۹';
    var out = input.replaceAll(RegExp(r'\s*(?:فاصلة|نقطة|point|dot)\s*'), '.');
    out = out.replaceAll(RegExp(r'\s+(?:ونص|ونصف)'), '.5');
    for (var i = 0; i < 10; i++) {
      out = out.replaceAll(ar[i], '$i').replaceAll(fa[i], '$i');
    }
    return _replaceNumberWords(out);
  }

  static String _replaceNumberWords(String text) {
    const map = {
      'مئتان': '200', 'ميتين': '200', 'مائة': '100', 'مئة': '100', 'مية': '100',
      'تسعون': '90', 'تسعين': '90', 'ثمانون': '80', 'ثمانين': '80', 'تمانين': '80',
      'سبعون': '70', 'سبعين': '70', 'ستون': '60', 'ستين': '60', 'خمسون': '50', 'خمسين': '50',
      'أربعون': '40', 'أربعين': '40', 'ثلاثون': '30', 'ثلاثين': '30', 'تلاتين': '30',
      'عشرون': '20', 'عشرين': '20', 'عشرة': '10', 'عشره': '10',
      'تسعة': '9', 'تسعه': '9', 'ثمانية': '8', 'تمانية': '8', 'سبعة': '7', 'سبعه': '7',
      'ستة': '6', 'سته': '6', 'خمسة': '5', 'خمسه': '5', 'أربعة': '4', 'اربعه': '4',
      'ثلاثة': '3', 'تلاتة': '3', 'اثنين': '2', 'اتنين': '2', 'واحد': '1',
    };
    var out = text;
    map.forEach((k, v) => out = out.replaceAll(RegExp('(^|\\s)$k(?=\\s|\$)'), ' $v '));
    out = out.replaceAllMapped(RegExp(r'\b(100|200)\s+و\s*(\d{1,2})\b'), (m) => '${int.parse(m.group(1)!) + int.parse(m.group(2)!)}');
    out = out.replaceAllMapped(RegExp(r'\b(\d{1})\s+و\s*(20|30|40|50|60|70|80|90)\b'), (m) => '${int.parse(m.group(1)!) + int.parse(m.group(2)!)}');
    return out;
  }

  static VitalVoiceParseResult parse(String spoken, List<String> contextOptions) {
    var text = normalizeDigits(spoken);
    final (date, withoutDate) = _extractDate(text);
    text = withoutDate;
    final (time, withoutTime) = _extractTime(text);
    text = withoutTime;
    final numbers = RegExp(r'\d+(?:\.\d+)?').allMatches(text).map((m) => m.group(0)!).toList();
    final contextIndex = _matchContextIndex(text, contextOptions);
    return VitalVoiceParseResult(numbers: numbers, contextIndex: contextIndex, date: date, time: time);
  }

  static (DateTime?, String) _extractDate(String text) {
    final lower = text.toLowerCase();
    final now = DateTime.now();
    if (RegExp(r'(أمس|امبارح|البارحة|yesterday)').hasMatch(lower)) {
      return (now.subtract(const Duration(days: 1)), text.replaceAll(RegExp(r'(أمس|امبارح|البارحة|yesterday)', caseSensitive: false), ' '));
    }
    if (RegExp(r'(اليوم|النهاردة|today)').hasMatch(lower)) {
      return (now, text.replaceAll(RegExp(r'(اليوم|النهاردة|today)', caseSensitive: false), ' '));
    }
    final m = RegExp(r'(\d{1,2})[/-](\d{1,2})(?:[/-](\d{2,4}))?').firstMatch(text);
    if (m != null) {
      final d = int.tryParse(m.group(1)!), mo = int.tryParse(m.group(2)!);
      var y = m.group(3) != null ? (int.tryParse(m.group(3)!) ?? now.year) : now.year;
      if (y < 100) y += 2000;
      if (d != null && mo != null && d >= 1 && d <= 31 && mo >= 1 && mo <= 12) return (DateTime(y, mo, d), text.replaceFirst(m.group(0)!, ' '));
    }
    return (null, text);
  }

  static (TimeOfDay?, String) _extractTime(String text) {
    final lower = text.toLowerCase();
    if (RegExp(r'(الآن|دلوقتي|now)').hasMatch(lower)) return (TimeOfDay.now(), text.replaceAll(RegExp(r'(الآن|دلوقتي|now)', caseSensitive: false), ' '));
    final m = RegExp(r'(?:(?:الساعة|ساعة|at)\s*)?(\d{1,2})(?::(\d{2}))?\s*(صباحاً|صباحا|الصبح|ص|am|مساءً|مساءا|مساء|بالليل|م|pm)', caseSensitive: false).firstMatch(text);
    if (m != null) {
      var h = int.tryParse(m.group(1)!) ?? 0;
      final min = int.tryParse(m.group(2) ?? '0') ?? 0;
      final isPm = RegExp(r'(مساء|بالليل|م|pm)', caseSensitive: false).hasMatch(m.group(3)!);
      if (isPm && h < 12) h += 12;
      if (!isPm && h == 12) h = 0;
      if (h >= 0 && h <= 23 && min >= 0 && min <= 59) return (TimeOfDay(hour: h, minute: min), text.replaceFirst(m.group(0)!, ' '));
    }
    final hhmm = RegExp(r'\b(\d{1,2}):(\d{2})\b').firstMatch(text);
    if (hhmm != null) {
      final h = int.tryParse(hhmm.group(1)!) ?? -1, min = int.tryParse(hhmm.group(2)!) ?? -1;
      if (h >= 0 && h <= 23 && min >= 0 && min <= 59) return (TimeOfDay(hour: h, minute: min), text.replaceFirst(hhmm.group(0)!, ' '));
    }
    return (null, text);
  }

  static int? _matchContextIndex(String text, List<String> options) {
    if (options.isEmpty) return null;
    final lower = text.toLowerCase();
    for (var i = 0; i < options.length; i++) {
      if (lower.contains(options[i].toLowerCase())) return i;
    }
    const keywords = [
      ['تمرين', 'exercise'], ['مشي', 'walking', 'walk'], ['راحة', 'مستريح', 'rest'],
      ['صائم', 'صايم', 'fasting'], ['إفطار', 'فطار', 'breakfast'], ['غداء', 'غدا', 'lunch'],
      ['نوم', 'sleep'], ['صباح', 'الصبح', 'morning'], ['مساء', 'بالليل', 'evening'],
    ];
    for (final group in keywords) {
      if (group.any(lower.contains)) {
        final idx = options.indexWhere((o) => group.any((k) => o.toLowerCase().contains(k)));
        if (idx != -1) return idx;
      }
    }
    return null;
  }
}
