import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:http/http.dart' as http;
import 'package:tapbar/controller/auth_controller.dart';
import 'package:tapbar/controller/favorite_controller.dart';
import 'package:tapbar/main.dart';
import 'package:tapbar/models/flat.dart';

class BookingProvider {
  final String baseUrl = MyApp.baseUrl.value;
  final String? token = Get.find<AuthController>().userToken.value;

  Future<void> rateFlat(int id, int rate) async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      var request = http.Request(
        'PUT',
        Uri.parse('$baseUrl/bookings/$id/rate?rate=$rate'),
      );

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        Get.snackbar(
          "Message",
          "Thanks for rating us",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.black.withOpacity(0.5),
          colorText: Colors.white,
          margin: EdgeInsets.all(8),
          borderRadius: 8,
          duration: Duration(seconds: 2),
          snackStyle: SnackStyle.FLOATING,
        );
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
