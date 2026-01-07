import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tapbar/screens/change_password_screen.dart';
import 'package:tapbar/screens/otp_screen.dart';
import 'dart:convert';

import '../controller/auth_controller.dart';
import '../controller/register_controller.dart';
import '../main.dart';
import '../models/user.dart';
import '../screens/login_screen.dart';

class OtpService {
  final String baseUrl = MyApp.baseUrl.value;
  final String? phone_number = Get.arguments as String?;
  final headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };
  Future<void> verifyOtp(
    String phone_number,
    String otp,
    bool isForgotPassword,
  ) async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('$baseUrl/verify-otp'),
      );
      request.fields.addAll({'phone_number': phone_number, 'otp': otp});

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      final respStr = await response.stream.bytesToString();
      final data = jsonDecode(respStr);

      if (response.statusCode == 200) {
        if (isForgotPassword) {
          Get.to(() => ChangePasswordScreen(), arguments: phone_number);
        } else {
          Get.offAll(() => LoginScreen());
        }
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
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> resendOtp(String phone_number) async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('$baseUrl/resend-otp'),
      );
      request.fields.addAll({'phone_number': phone_number});

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      final respStr = await response.stream.bytesToString();
      final data = jsonDecode(respStr);

      if (response.statusCode == 200) {
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
    } catch (e) {
      print(e.toString());
    }
  }

  Future<bool> forgotPassword(String phone_number) async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('$baseUrl/forgot-Password'),
      );
      request.fields.addAll({'phone_number': phone_number});

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      final respStr = await response.stream.bytesToString();
      final data = jsonDecode(respStr);

      if (response.statusCode == 200) {
        return true;
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
        return false;
      }
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<void> resetPassword(
    String phone_number,
    String password,
    String password_confirmation,
  ) async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('$baseUrl/reset-Password'),
      );
      request.fields.addAll({
        'phone_number': phone_number,
        'password': password,
        'password_confirmation': password_confirmation,
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      final respStr = await response.stream.bytesToString();
      final data = jsonDecode(respStr);

      if (response.statusCode == 200) {
        Get.offAll(() => LoginScreen());
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
    } catch (e) {
      print(e.toString());
    }
  }
}
