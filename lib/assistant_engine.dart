import 'dart:convert';
import 'package:http/http.dart' as http;
import 'voice_engine.dart';
import 'tts_engine.dart';
import 'config.dart';

class AssistantEngine {
  final VoiceEngine voice;
  final TTSEngine tts;
  bool running = false;

  AssistantEngine(this.voice, this.tts);

  Future<void> start() async {
    running = true;

    while (running) {
      final text = await voice.listen();
      if (text.isEmpty) continue;

      // Wake word filter
      if (!text.toLowerCase().contains("baby")) continue;

      final cleaned = text.toLowerCase().replaceAll("baby", "").trim();

      try {
        final res = await http.post(
          Uri.parse(Config.apiUrl),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"text": cleaned}),
        );

        final data = jsonDecode(res.body);
        final reply = data["response"] ?? "I don't understand.";

        await tts.speak(reply);
      } catch (_) {
        await tts.speak("Connection error.");
      }
    }
  }

  void stop() {
    running = false;
  }
}
