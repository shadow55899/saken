import 'package:apartment/controller/auth_controller.dart';
import 'package:apartment/main.dart';
import 'package:apartment/models/flat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FlatProvider {
  final String baseUrl = MyApp.baseUrl.value;
  static List<Flat> flats = [];
  final headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };
  Future<void> getAllFlats() async {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${Get.find<AuthController>().userToken}',
    };
    var request = http.Request(
      'GET',
      Uri.parse('$baseUrl/apartment/all'),
    );

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    final respStr = await response.stream.bytesToString();
    final data = jsonDecode(respStr);

    if (response.statusCode == 200) {
      flats = [];
      flats = Flat.parseFlats(data['data']);
    } else {
        Get.snackbar(
          "Message",
          data["message"],
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.black.withOpacity(0.5),
          colorText: Colors.white,
          margin: EdgeInsets.all(8),
          borderRadius: 8,
          duration: Duration(seconds: 2),
          snackStyle: SnackStyle.FLOATING,
        );
      }
  }
}
