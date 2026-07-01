import 'package:flutter/material.dart';
import 'services/api_service.dart';

void main() => runApp(const BabyAI());

class BabyAI extends StatelessWidget {
  const BabyAI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      home: const ChatPage(),
    );
  }
}

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final controller = TextEditingController();
  final List<Map<String, String>> messages = [];

  Future<void> send() async {
    final text = controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      messages.add({"role": "You", "text": text});
    });

    controller.clear();

    final reply = await ApiService.chat(text);

    setState(() {
      messages.add({"role": "Baby AI", "text": reply});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Baby AI")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: messages.length,
              itemBuilder: (_, i) {
                final m = messages[i];
                return Card(
                  child: ListTile(
                    title: Text(m["role"]!),
                    subtitle: Text(m["text"]!),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: "Ask Baby AI anything...",
                    ),
                    onSubmitted: (_) => send(),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: send,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
