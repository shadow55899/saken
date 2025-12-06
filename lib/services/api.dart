import 'dart:convert';
import 'package:apartment/main.dart';
import 'package:http/http.dart' as http;

class Api {
  static Future<Map<String, dynamic>> post(
    String endpoint,
    Map<String, String> body,
    Map<String, String>? headers,
  ) async {
    final response = await http.post(
      Uri.parse(
        "http://192.168.50.105/api/$endpoint",
      ), // ✅ for Android emulator
      body: body,
      headers: headers,
    );

    return json.decode(response.body);
  }
}
