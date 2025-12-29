import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tapbar/screens/otp_screen.dart';
import 'dart:convert';

import '../controller/auth_controller.dart';
import '../controller/register_controller.dart';
import '../main.dart';
import '../models/user.dart';
import '../screens/login_screen.dart';

class OtpService {
  final String baseUrl = MyApp.baseUrl.value;
  final String phone_number = Get.arguments as String;
  final headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };
  Future<void> verifyOtp() async {
    try {var headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer 3|GbdZc1MlPsgNbc68Y0w4eHVbjDbv9avGAPvbS8nD00bbd1e3'
};
var request = http.MultipartRequest('POST', Uri.parse('http://192.168.50.105:8000/api/verify-otp'));
request.fields.addAll({
  'phone_number': '0932483667',
  'otp': '347129'
});

request.headers.addAll(headers);

http.StreamedResponse response = await request.send();

if (response.statusCode == 200) {
  print(await response.stream.bytesToString());
}
else {
  print(response.reasonPhrase);
}
} catch (e) {
      print(e.toString());
    }
  }
}
