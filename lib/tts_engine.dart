import 'package:flutter_tts/flutter_tts.dart';

class TTSEngine {
  final FlutterTts tts = FlutterTts();

  Future speak(String text) async {
    await tts.setLanguage("en-US");
    await tts.setSpeechRate(0.5);
    await tts.speak(text);
  }
}
