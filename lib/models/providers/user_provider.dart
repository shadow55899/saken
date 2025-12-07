import 'package:apartment/main.dart';
import 'package:apartment/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserProvider {
  final String baseUrl = MyApp.baseUrl.value;
  final headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };
  Future<void> login(
    String phone_number,
    String password,
    bool isLoading,
  ) async {
    try {
      isLoading = true;
      var request = http.MultipartRequest('POST', Uri.parse('$baseUrl/login'));
      request.fields.addAll({
        'phone_number': phone_number,
        'password': password,
      });
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      final respStr = await response.stream.bytesToString();

      final data = jsonDecode(respStr);

      if (response.statusCode == 201) {
        isLoading = false;
        Get.off(() => HomeScreen());
        Get.snackbar(
          "Message",
          "Login successful",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.black.withOpacity(0.5),
          colorText: Colors.white,
          margin: EdgeInsets.all(8),
          borderRadius: 8,
          duration: Duration(seconds: 2),
          snackStyle: SnackStyle.FLOATING, // makes it float like a toast
        );
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      Get.snackbar(
        "Message", // Title
        e.toString(), // Message
        snackPosition: SnackPosition.BOTTOM, // Position (TOP or BOTTOM)
        duration: Duration(seconds: 77), // How long it shows
      );
    }
  }
}
