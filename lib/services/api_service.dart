import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://babyai-lzr8.onrender.com";

  static Future<String> chat(String message) async {
    final response = await http.post(
      Uri.parse("$baseUrl/chat"),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "message": message,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data["reply"] ?? "No response";
    }

    return "Server error";
  }
}
