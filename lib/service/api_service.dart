import 'dart:convert';
import 'package:apartment/main.dart';
import 'package:http/http.dart' as http;


class ApiService {
  static String baseUrl = MyApp.baseUrl.value;
  
  static String? token;
  final headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };
  static Map<String, String> defaultHeaders = {
    "Accept": "application/json",
    "Content-Type": "application/json",
  };

  static Map<String, String> authHeaders(String token) {
    return {"Accept": "application/json", "Authorization": "Bearer $token"};
  }

  static Future<Map<String, dynamic>> put(
    String endpoint, {
    Map<String, String>? headers,
  }) async {
    final response = await http.put(
      Uri.parse("$baseUrl$endpoint"),
      headers: headers ?? defaultHeaders,
    );

    return _processResponse(response);
  }

  static Future<Map<String, dynamic>> post(
    String endpoint,
    Map<String, dynamic> body, {
    Map<String, String>? headers,
  }) async {
    final response = await http.post(
      Uri.parse("$baseUrl$endpoint"),
      headers: headers ?? defaultHeaders,
      body: jsonEncode(body),
    );

    return _processResponse(response);
  }

  static Future<Map<String, dynamic>> get(
    String endpoint, {
    Map<String, String>? headers,
  }) async {
    final response = await http.get(
      Uri.parse("$baseUrl$endpoint"),
      headers: headers ?? defaultHeaders,
    );

    return _processResponse(response);
  }

  static Future<Map<String, dynamic>> upload(
    String endpoint,
    Map<String, String> fields,
    Map<String, String> files, {
    Map<String, String>? headers,
  }) async {
    var request = http.MultipartRequest("POST", Uri.parse("$baseUrl$endpoint"));
    request.fields.addAll(fields);

    files.forEach((name, path) async {
      request.files.add(await http.MultipartFile.fromPath(name, path));
    });

    request.headers.addAll(headers ?? defaultHeaders);

    final response = await request.send();
    final respStr = await response.stream.bytesToString();

    return jsonDecode(respStr);
  }

  static Map<String, dynamic> _processResponse(http.Response response) {
    try {
      final body = jsonDecode(response.body);

      // Add the status code without modifying the response structure
      return {
        "status_code": response.statusCode,
        "body": body,
        "data": body["data"],
        "success": body["success"],
        "message": body["message"],
      };
    } catch (e) {
      return {
        "status_code": response.statusCode,
        "body": response.body,
        "data": null,
        "success": false,
        "message": "Invalid JSON response",
      };
    }
  }
}
