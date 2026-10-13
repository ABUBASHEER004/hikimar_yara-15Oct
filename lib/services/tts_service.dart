import 'package:flutter_tts/flutter_tts.dart';

class TtsService {
  final FlutterTts _tts = FlutterTts();

  Future<void> speak(String text, {required bool english}) async {
    await _tts.stop();
    await _tts.setLanguage(english ? 'en-US' : 'ha-NG');
    await _tts.setSpeechRate(english ? 0.45 : 0.30);
    await _tts.setPitch(1.05);
    await _tts.speak(text);
  }

  Future<void> stop() => _tts.stop();
  Future<void> pause() => _tts.pause();
}
