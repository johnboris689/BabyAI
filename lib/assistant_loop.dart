import 'assistant_engine.dart';
import 'voice_engine.dart';
import 'tts_engine.dart';

class AssistantLoop {
  final AssistantEngine engine;

  bool running = false;

  AssistantLoop(this.engine);

  Future<void> start() async {
    running = true;

    await engine.start(); // continuous loop already handles wake word
  }

  void stop() {
    running = false;
    engine.stop();
  }
}
