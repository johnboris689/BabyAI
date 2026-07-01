import 'package:speech_to_text/speech_to_text.dart';

class VoiceEngine {
  final SpeechToText _speech = SpeechToText();

  Future<bool> init() async {
    return await _speech.initialize();
  }

  Future<String> listen() async {
    String text = "";

    await _speech.listen(
      onResult: (result) {
        text = result.recognizedWords;
      },
    );

    await Future.delayed(const Duration(seconds: 3));
    await _speech.stop();

    return text;
  }
}
