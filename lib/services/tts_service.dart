import 'package:flutter_tts/flutter_tts.dart';

class TtsService {
  final FlutterTts _tts = FlutterTts();

  Future<void> speak(String text, {required bool english}) async {
    await _tts.stop();

    // Hausa voices often sound clearer at a slower pace with a slightly
    // lower pitch. Device TTS engines may interpret these values differently.
    await _tts.setLanguage(english ? 'en-US' : 'ha-NG');
    await _tts.setSpeechRate(english ? 0.42 : 0.30);
    await _tts.setPitch(english ? 1.0 : 0.92);
    await _tts.awaitSpeakCompletion(true);
    await _tts.speak(text);
  }

  Future<void> stop() => _tts.stop();
  Future<void> pause() => _tts.pause();
}
