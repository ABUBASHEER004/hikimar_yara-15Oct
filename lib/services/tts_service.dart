import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TtsService {
  final FlutterTts _tts = FlutterTts();

  bool _initialized = false;
  bool _isSpeaking = false;
  bool _isInitializing = false;

  /// Actual Hausa voice discovered on the device.
  Map<String, String>? _hausaVoice;

  /// All voices discovered from the current TTS engine.
  List<dynamic> _availableVoices = <dynamic>[];

  /// Whether a real Hausa voice was discovered.
  bool get hasHausaVoice => _hausaVoice != null;

  /// Whether TTS is currently speaking.
  bool get isSpeaking => _isSpeaking;

  // ===========================================================================
  // INITIALIZATION
  // ===========================================================================

  Future<void> initialize() async {
    if (_initialized) return;

    if (_isInitializing) {
      while (_isInitializing) {
        await Future.delayed(
          const Duration(milliseconds: 50),
        );
      }
      return;
    }

    _isInitializing = true;

    try {
      // -----------------------------------------------------------------------
      // Android: Prefer Google Speech Services.
      // -----------------------------------------------------------------------

      if (Platform.isAndroid) {
        try {
          await _tts.setEngine('com.google.android.tts');

          debugPrint(
            'TTS: Google Speech Services engine selected.',
          );
        } catch (e) {
          debugPrint(
            'TTS: Could not select Google Speech Services.',
          );
          debugPrint(
            'TTS: Using the device default engine.',
          );
          debugPrint(
            'TTS ENGINE ERROR: $e',
          );
        }
      }

      // -----------------------------------------------------------------------
      // Wait for each utterance to complete.
      // -----------------------------------------------------------------------

      try {
        await _tts.awaitSpeakCompletion(true);
      } catch (e) {
        debugPrint(
          'TTS: awaitSpeakCompletion failed: $e',
        );
      }

      // -----------------------------------------------------------------------
      // Event handlers.
      // -----------------------------------------------------------------------

      _tts.setStartHandler(() {
        _isSpeaking = true;

        debugPrint(
          'TTS: Speech started.',
        );
      });

      _tts.setCompletionHandler(() {
        _isSpeaking = false;

        debugPrint(
          'TTS: Speech completed.',
        );
      });

      _tts.setCancelHandler(() {
        _isSpeaking = false;

        debugPrint(
          'TTS: Speech cancelled.',
        );
      });

      _tts.setErrorHandler((message) {
        _isSpeaking = false;

        debugPrint(
          'TTS ERROR: $message',
        );
      });

      // -----------------------------------------------------------------------
      // Discover voices.
      // -----------------------------------------------------------------------

      await _loadVoices();

      _initialized = true;
    } catch (e) {
      debugPrint(
        'TTS INITIALIZATION ERROR: $e',
      );

      _initialized = true;
    } finally {
      _isInitializing = false;
    }
  }

  // ===========================================================================
  // LOAD VOICES
  // ===========================================================================

  Future<void> _loadVoices() async {
    try {
      // IMPORTANT:
      // getVoices is a Future getter in this flutter_tts version.
      // Do NOT use getVoices().
      final dynamic result = await _tts.getVoices;

      if (result is! List) {
        debugPrint(
          'TTS: getVoices did not return a List.',
        );

        _availableVoices = <dynamic>[];
        _hausaVoice = null;

        return;
      }

      _availableVoices = List<dynamic>.from(result);

      debugPrint('');
      debugPrint('================================================');
      debugPrint('             AVAILABLE TTS VOICES');
      debugPrint('================================================');

      if (_availableVoices.isEmpty) {
        debugPrint(
          'TTS: NO VOICES WERE RETURNED.',
        );
      }

      for (final voice in _availableVoices) {
        final name = _voiceName(voice);
        final locale = _voiceLanguage(voice);

        final hausa = _looksLikeHausaVoice(
          name: name,
          locale: locale,
        );

        debugPrint(
          'VOICE: $name | LOCALE: $locale'
          '${hausa ? '  <-- HAUSA CANDIDATE' : ''}',
        );
      }

      debugPrint('================================================');
      debugPrint('');

      // -----------------------------------------------------------------------
      // Select best Hausa voice.
      // -----------------------------------------------------------------------

      _hausaVoice = _selectBestHausaVoice(
        _availableVoices,
      );

      if (_hausaVoice != null) {
        debugPrint(
          'TTS: BEST HAUSA VOICE SELECTED -> '
          '${_hausaVoice!['name']} '
          '(${_hausaVoice!['locale']})',
        );
      } else {
        debugPrint(
          'TTS WARNING: No Hausa voice was found.',
        );
      }
    } catch (e) {
      debugPrint(
        'TTS VOICE DISCOVERY ERROR: $e',
      );

      _availableVoices = <dynamic>[];
      _hausaVoice = null;
    }
  }

  // ===========================================================================
  // HAUSA VOICE SELECTION
  // ===========================================================================

  Map<String, String>? _selectBestHausaVoice(
    List<dynamic> voices,
  ) {
    Map<String, String>? bestVoice;

    int bestScore = -1;

    for (final voice in voices) {
      final name = _voiceName(voice).trim();
      final locale = _voiceLanguage(voice).trim();

      if (name.isEmpty && locale.isEmpty) {
        continue;
      }

      final score = _hausaVoiceScore(
        name: name,
        locale: locale,
      );

      if (score > bestScore) {
        bestScore = score;

        bestVoice = {
          'name': name,
          'locale': locale,
        };
      }
    }

    if (bestScore <= 0) {
      return null;
    }

    return bestVoice;
  }

  int _hausaVoiceScore({
    required String name,
    required String locale,
  }) {
    final normalizedLocale = _normalizeLocale(locale);
    final normalizedName = name.toLowerCase().trim();

    // Exact Nigerian Hausa.
    if (normalizedLocale == 'ha-ng') {
      return 100;
    }

    // Generic Hausa.
    if (normalizedLocale == 'ha') {
      return 90;
    }

    // Other Hausa regional locale.
    if (normalizedLocale.startsWith('ha-')) {
      return 80;
    }

    // Hausa in voice name.
    if (normalizedName.contains('hausa')) {
      return 70;
    }

    // Possible Hausa identifier.
    if (normalizedName.contains('hau')) {
      return 20;
    }

    return 0;
  }

  bool _looksLikeHausaVoice({
    required String name,
    required String locale,
  }) {
    return _hausaVoiceScore(
          name: name,
          locale: locale,
        ) >
        0;
  }

  // ===========================================================================
  // HAUSA DIAGNOSTIC
  // ===========================================================================

  /// Runs a detailed Hausa TTS diagnostic.
  ///
  /// This is useful when Hausa pronunciation is not working.
  Future<void> diagnoseHausa() async {
    await initialize();

    debugPrint('');
    debugPrint('==============================================');
    debugPrint('           HAUSA TTS DIAGNOSTIC');
    debugPrint('==============================================');

    debugPrint(
      'Total voices detected: ${_availableVoices.length}',
    );

    final hausaVoices = _availableVoices.where((voice) {
      final locale = _normalizeLocale(
        _voiceLanguage(voice),
      );

      final name = _voiceName(voice).toLowerCase();

      return locale == 'ha' ||
          locale.startsWith('ha-') ||
          name.contains('hausa') ||
          name.contains('hau');
    }).toList();

    debugPrint(
      'Potential Hausa voices: ${hausaVoices.length}',
    );

    debugPrint('');

    if (hausaVoices.isEmpty) {
      debugPrint(
        '❌ NO HAUSA VOICE DETECTED',
      );

      debugPrint('');

      debugPrint(
        'Android TTS is not currently exposing '
        'a Hausa voice to this application.',
      );

      debugPrint('');

      debugPrint(
        'Please check Google Speech Services and '
        'install Hausa voice data if available.',
      );
    } else {
      debugPrint(
        '✅ HAUSA VOICES FOUND: ${hausaVoices.length}',
      );

      debugPrint('');

      for (final voice in hausaVoices) {
        debugPrint(
          'HAUSA VOICE -> '
          '${_voiceName(voice)} '
          '| ${_voiceLanguage(voice)}',
        );
      }

      debugPrint('');

      if (_hausaVoice != null) {
        debugPrint(
          '✅ SELECTED HAUSA VOICE -> '
          '${_hausaVoice!['name']} '
          '(${_hausaVoice!['locale']})',
        );
      }
    }

    debugPrint('');
    debugPrint('==============================================');
    debugPrint('');
  }

  // ===========================================================================
  // PUBLIC VOICE DIAGNOSTIC
  // ===========================================================================

  Future<void> printAvailableVoices() async {
    await initialize();

    try {
      await _loadVoices();

      debugPrint('');
      debugPrint('================================================');
      debugPrint('              TTS DIAGNOSTIC RESULT');
      debugPrint('================================================');

      debugPrint(
        'Total voices: ${_availableVoices.length}',
      );

      if (_hausaVoice != null) {
        debugPrint(
          'Hausa voice: '
          '${_hausaVoice!['name']} '
          '(${_hausaVoice!['locale']})',
        );
      } else {
        debugPrint(
          'Hausa voice: NOT AVAILABLE',
        );
      }

      debugPrint('================================================');
      debugPrint('');
    } catch (e) {
      debugPrint(
        'TTS DIAGNOSTIC ERROR: $e',
      );
    }
  }

  // ===========================================================================
  // SPEAK
  // ===========================================================================

  Future<void> speak(
    String text, {
    required bool english,
  }) async {
    final cleanText = _cleanText(text);

    if (cleanText.isEmpty) {
      return;
    }

    await initialize();

    // Stop any existing speech.
    await stop();

    await Future.delayed(
      const Duration(milliseconds: 100),
    );

    if (english) {
      await _configureEnglish();
    } else {
      final configured = await _configureHausa();

      if (!configured) {
        debugPrint('');
        debugPrint(
          '================================================',
        );
        debugPrint(
          'TTS: HAUSA SPEECH CANCELLED',
        );
        debugPrint(
          'No genuine Hausa voice is available.',
        );
        debugPrint(
          '================================================',
        );
        debugPrint('');

        return;
      }
    }

    await _speakText(cleanText);
  }

  // ===========================================================================
  // ENGLISH
  // ===========================================================================

  Future<void> _configureEnglish() async {
    bool configured = false;

    try {
      await _tts.setLanguage('en-US');

      configured = true;

      debugPrint(
        'TTS: English locale selected: en-US',
      );
    } catch (e) {
      debugPrint(
        'TTS: en-US unavailable: $e',
      );
    }

    if (!configured) {
      try {
        await _tts.setLanguage('en-GB');

        configured = true;

        debugPrint(
          'TTS: English locale selected: en-GB',
        );
      } catch (e) {
        debugPrint(
          'TTS: en-GB unavailable: $e',
        );
      }
    }

    await _tts.setSpeechRate(0.45);
    await _tts.setPitch(1.0);
    await _tts.setVolume(1.0);
  }

  // ===========================================================================
  // HAUSA
  // ===========================================================================

  Future<bool> _configureHausa() async {
    // -------------------------------------------------------------------------
    // First choice: selected Hausa voice.
    // -------------------------------------------------------------------------

    if (_hausaVoice != null) {
      final name = _hausaVoice!['name'];
      final locale = _hausaVoice!['locale'];

      if (name != null &&
          name.trim().isNotEmpty &&
          locale != null &&
          locale.trim().isNotEmpty) {
        try {
          await _tts.setVoice({
            'name': name,
            'locale': locale,
          });

          await _tts.setSpeechRate(0.34);
          await _tts.setPitch(0.95);
          await _tts.setVolume(1.0);

          debugPrint(
            'TTS: Using Hausa voice: '
            '$name ($locale)',
          );

          return true;
        } catch (e) {
          debugPrint(
            'TTS: Could not select Hausa voice '
            '$name ($locale): $e',
          );
        }
      }
    }

    // -------------------------------------------------------------------------
    // Second choice: exact ha-NG voice.
    // -------------------------------------------------------------------------

    final hausaNigeria = _findVoiceByLocale('ha-NG');

    if (hausaNigeria != null) {
      try {
        final name = _voiceName(hausaNigeria);
        final locale = _voiceLanguage(hausaNigeria);

        await _tts.setVoice({
          'name': name,
          'locale': locale,
        });

        await _tts.setSpeechRate(0.34);
        await _tts.setPitch(0.95);
        await _tts.setVolume(1.0);

        _hausaVoice = {
          'name': name,
          'locale': locale,
        };

        debugPrint(
          'TTS: Hausa-Nigeria voice selected: '
          '$name ($locale)',
        );

        return true;
      } catch (e) {
        debugPrint(
          'TTS: Could not activate ha-NG voice: $e',
        );
      }
    }

    // -------------------------------------------------------------------------
    // Third choice: generic Hausa.
    // -------------------------------------------------------------------------

    final genericHausa = _findGenericHausaVoice();

    if (genericHausa != null) {
      try {
        final name = _voiceName(genericHausa);
        final locale = _voiceLanguage(genericHausa);

        await _tts.setVoice({
          'name': name,
          'locale': locale,
        });

        await _tts.setSpeechRate(0.34);
        await _tts.setPitch(0.95);
        await _tts.setVolume(1.0);

        _hausaVoice = {
          'name': name,
          'locale': locale,
        };

        debugPrint(
          'TTS: Generic Hausa voice selected: '
          '$name ($locale)',
        );

        return true;
      } catch (e) {
        debugPrint(
          'TTS: Could not activate generic Hausa voice: $e',
        );
      }
    }

    // -------------------------------------------------------------------------
    // No English fallback.
    // -------------------------------------------------------------------------

    debugPrint('');
    debugPrint(
      '================================================',
    );
    debugPrint(
      'TTS WARNING: NO REAL HAUSA VOICE AVAILABLE.',
    );
    debugPrint(
      'Install/enable a Hausa-supported TTS voice '
      'on the Android device.',
    );
    debugPrint(
      '================================================',
    );
    debugPrint('');

    return false;
  }

  // ===========================================================================
  // FIND HAUSA VOICE
  // ===========================================================================

  dynamic _findVoiceByLocale(String wantedLocale) {
    final wanted = _normalizeLocale(wantedLocale);

    for (final voice in _availableVoices) {
      final locale = _normalizeLocale(
        _voiceLanguage(voice),
      );

      if (locale == wanted) {
        return voice;
      }
    }

    return null;
  }

  dynamic _findGenericHausaVoice() {
    for (final voice in _availableVoices) {
      final locale = _normalizeLocale(
        _voiceLanguage(voice),
      );

      final name = _voiceName(voice).toLowerCase();

      if (locale == 'ha' ||
          locale.startsWith('ha-') ||
          name.contains('hausa')) {
        return voice;
      }
    }

    return null;
  }

  // ===========================================================================
  // SPEECH
  // ===========================================================================

  Future<void> _speakText(String text) async {
    final chunks = _splitText(text);

    debugPrint(
      'TTS: Speaking ${chunks.length} chunk(s).',
    );

    for (final chunk in chunks) {
      if (chunk.trim().isEmpty) {
        continue;
      }

      try {
        await _tts.speak(chunk);

        await Future.delayed(
          const Duration(milliseconds: 120),
        );
      } catch (e) {
        debugPrint(
          'TTS SPEAK ERROR: $e',
        );

        _isSpeaking = false;

        break;
      }
    }
  }

  // ===========================================================================
  // TEXT CLEANING
  // ===========================================================================

  String _cleanText(String text) {
    var cleaned = text.trim();

    // Remove excessive spaces.
    cleaned = cleaned.replaceAll(
      RegExp(r'[ \t]+'),
      ' ',
    );

    // Limit excessive blank lines.
    cleaned = cleaned.replaceAll(
      RegExp(r'\n{3,}'),
      '\n\n',
    );

    return cleaned.trim();
  }

  // ===========================================================================
  // TEXT SPLITTING
  // ===========================================================================

  List<String> _splitText(
    String text, {
    int maxCharacters = 1200,
  }) {
    final cleanText = text.trim();

    if (cleanText.isEmpty) {
      return <String>[];
    }

    if (cleanText.length <= maxCharacters) {
      return <String>[cleanText];
    }

    final sentences = cleanText.split(
      RegExp(
        r'(?<=[.!?।؛])\s+',
      ),
    );

    final chunks = <String>[];

    var current = StringBuffer();

    for (final sentence in sentences) {
      final cleanSentence = sentence.trim();

      if (cleanSentence.isEmpty) {
        continue;
      }

      final separatorLength =
          current.isEmpty ? 0 : 1;

      final proposedLength =
          current.length +
          separatorLength +
          cleanSentence.length;

      if (proposedLength <= maxCharacters) {
        if (current.isNotEmpty) {
          current.write(' ');
        }

        current.write(cleanSentence);

        continue;
      }

      if (current.isNotEmpty) {
        chunks.add(
          current.toString().trim(),
        );

        current = StringBuffer();
      }

      // Very long sentence: split by words.
      if (cleanSentence.length > maxCharacters) {
        final words = cleanSentence.split(
          RegExp(r'\s+'),
        );

        var wordChunk = StringBuffer();

        for (final word in words) {
          if (word.isEmpty) {
            continue;
          }

          final separator =
              wordChunk.isEmpty ? 0 : 1;

          final length =
              wordChunk.length +
              separator +
              word.length;

          if (length <= maxCharacters) {
            if (wordChunk.isNotEmpty) {
              wordChunk.write(' ');
            }

            wordChunk.write(word);
          } else {
            if (wordChunk.isNotEmpty) {
              chunks.add(
                wordChunk.toString().trim(),
              );
            }

            wordChunk = StringBuffer(word);
          }
        }

        if (wordChunk.isNotEmpty) {
          current.write(
            wordChunk.toString(),
          );
        }
      } else {
        current.write(cleanSentence);
      }
    }

    if (current.isNotEmpty) {
      chunks.add(
        current.toString().trim(),
      );
    }

    return chunks
        .where(
          (chunk) => chunk.trim().isNotEmpty,
        )
        .toList();
  }

  // ===========================================================================
  // VOICE HELPERS
  // ===========================================================================

  String _normalizeLocale(String locale) {
    return locale
        .toLowerCase()
        .replaceAll('_', '-')
        .trim();
  }

  String _voiceLanguage(dynamic voice) {
    if (voice is Map) {
      final value =
          voice['locale'] ??
          voice['language'] ??
          voice['lang'];

      return value?.toString() ?? '';
    }

    try {
      final value = voice.locale;

      return value?.toString() ?? '';
    } catch (_) {
      return '';
    }
  }

  String _voiceName(dynamic voice) {
    if (voice is Map) {
      final value =
          voice['name'] ??
          voice['voiceName'] ??
          voice['id'];

      return value?.toString() ?? '';
    }

    try {
      final value = voice.name;

      return value?.toString() ?? '';
    } catch (_) {
      return '';
    }
  }

  // ===========================================================================
  // STOP
  // ===========================================================================

  Future<void> stop() async {
    try {
      await _tts.stop();
    } catch (e) {
      debugPrint(
        'TTS STOP ERROR: $e',
      );
    }

    _isSpeaking = false;
  }

  // ===========================================================================
  // PAUSE
  // ===========================================================================

  Future<void> pause() async {
    try {
      await _tts.pause();
    } catch (e) {
      debugPrint(
        'TTS PAUSE ERROR: $e',
      );
    }
  }

  // ===========================================================================
  // RESUME
  // ===========================================================================

  Future<void> resume() async {
    debugPrint(
      'TTS: Resume is not supported reliably '
      'by the current flutter_tts engine.',
    );
  }

  // ===========================================================================
  // DISPOSE
  // ===========================================================================

  Future<void> dispose() async {
    await stop();
  }
}