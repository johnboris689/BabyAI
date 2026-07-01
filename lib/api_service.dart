import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://babyai-lzr8.onrender.com';

  static Future<String> checkServer() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data["message"] ?? "Baby AI is online";
      }

      return "Server error: ${response.statusCode}";
    } catch (e) {
      return "Connection failed: $e";
    }
  }
}
