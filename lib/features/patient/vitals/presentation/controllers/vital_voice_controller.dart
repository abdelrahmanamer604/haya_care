import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart';

class VitalVoiceController extends ChangeNotifier {
  final SpeechToText _speech = SpeechToText();
  final TextEditingController textController = TextEditingController();

  bool _available = false;
  bool isListening = false;
  bool initFailed = false;
  String? _localeId;
  String _committedText = '';
  String _currentSegment = '';

  String _join(String a, String b) {
    final left = a.trim();
    final right = b.trim();
    if (left.isEmpty) return right;
    if (right.isEmpty) return left;
    return '$left $right';
  }

  void _commitCurrentSegment() {
    if (_currentSegment.trim().isEmpty) return;
    _committedText = _join(_committedText, _currentSegment);
    _currentSegment = '';
    textController.text = _committedText;
  }

  Future<void> initAndListen() async {
    final granted = await _ensureMicPermission();
    if (!granted) {
      initFailed = true;
      notifyListeners();
      return;
    }
    try {
      final ok = await _speech.initialize(
        onStatus: (status) {
          final active = status == 'listening';
          if (!active && isListening) _commitCurrentSegment();
          isListening = active;
          notifyListeners();
        },
        onError: (_) {
          _commitCurrentSegment();
          isListening = false;
          initFailed = true;
          notifyListeners();
        },
      );
      if (ok) _localeId = (await _speech.systemLocale())?.localeId;
      _available = ok;
      initFailed = !ok;
      notifyListeners();
      if (ok) await startListening();
    } catch (_) {
      initFailed = true;
      notifyListeners();
    }
  }

  Future<bool> _ensureMicPermission() async {
    if (kIsWeb) return true;
    try {
      var status = await Permission.microphone.status;
      if (!status.isGranted) status = await Permission.microphone.request();
      return status.isGranted;
    } catch (_) {
      return true;
    }
  }

  Future<void> startListening() async {
    if (!_available) return;
    _committedText = textController.text.trim();
    _currentSegment = '';
    isListening = true;
    initFailed = false;
    notifyListeners();
    await _speech.listen(
      listenOptions: SpeechListenOptions(
        localeId: _localeId,
        partialResults: true,
        cancelOnError: false,
        listenMode: ListenMode.dictation,
        listenFor: const Duration(seconds: 30),
        pauseFor: const Duration(seconds: 5),
      ),
      onResult: (res) {
        final spoken = res.recognizedWords.trim();
        if (spoken.isEmpty) return;
        _currentSegment = spoken;
        textController.text = _join(_committedText, _currentSegment);
        if (res.finalResult) _commitCurrentSegment();
      },
    );
  }

  Future<void> toggleListening() async {
    if (isListening) {
      await _speech.stop();
      _commitCurrentSegment();
      isListening = false;
      notifyListeners();
      return;
    }
    _available ? await startListening() : await initAndListen();
  }

  @override
  void dispose() {
    _speech.stop();
    textController.dispose();
    super.dispose();
  }
}
