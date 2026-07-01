import 'package:flutter/material.dart';
import 'api_service.dart';

void main() {
  runApp(const BabyAIApp());
}

class BabyAIApp extends StatelessWidget {
  const BabyAIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Baby AI',
      theme: ThemeData.dark(useMaterial3: true),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String status = "Tap the microphone to test Baby AI";

  Future<void> testServer() async {
    setState(() {
      status = "Connecting...";
    });

    final result = await ApiService.checkServer();

    setState(() {
      status = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Baby AI"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            status,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 22),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: testServer,
        child: const Icon(Icons.mic),
      ),
    );
  }
}
