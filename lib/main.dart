import 'package:flutter/material.dart';
import 'assistant_engine.dart';
import 'voice_engine.dart';
import 'tts_engine.dart';

void main() => runApp(const BabyAI());

class BabyAI extends StatelessWidget {
  const BabyAI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const BootScreen(),
    );
  }
}

class BootScreen extends StatefulWidget {
  const BootScreen({super.key});

  @override
  State<BootScreen> createState() => _BootScreenState();
}

class _BootScreenState extends State<BootScreen> {
  String status = "Starting Baby AI...";

  @override
  void initState() {
    super.initState();
    start();
  }

  Future<void> start() async {
    final engine = AssistantEngine(VoiceEngine(), TTSEngine());

    setState(() => status = "Listening for 'baby'...");

    await engine.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          status,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
