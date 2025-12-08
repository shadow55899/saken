import 'dart:io';

import 'package:apartment/controller/register_controller.dart';
import 'package:apartment/main.dart';
import 'package:apartment/models/user.dart';
import 'package:apartment/screens/home_screen.dart';
import 'package:apartment/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserProvider {
  final String baseUrl = MyApp.baseUrl.value;
  static String? token;
  static User? currentuser;
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
      final userJson = data['data']['user'];
      token = data['Token'];
      currentuser = User.fromJson(userJson);

      print(token);

      if (data['status_code'] == 201) {
        isLoading = false;
        currentuser = User.fromJson(data['data']['user']);
        Get.off(() => HomeScreen());
        Get.snackbar(
          "Message",
          data['message'],
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
          data['message'],
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
      Get.snackbar(
        "Message",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 25),
      );
    }
  }

  Future<void> register(
    String first_name,
    String last_name,
    String phone_number,
    String password,
    String password_confimation,
    bool isLoading,
    DateTime date_of_birth,
    File personal_image,
    File id_image,
    Role role,
  ) async {
    try {
      isLoading = true;
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('$baseUrl/register'),
      );
      request.fields.addAll({
        'firstname': first_name,
        'lastname': last_name,
        'phone_number': phone_number,
        'password': password,
        'password_confirmation': password_confimation,
        'date_of_birth':
            "${date_of_birth.year}-${date_of_birth.month}-${date_of_birth.day}",
        'role': role.name,
      });
      request.files.add(
        await http.MultipartFile.fromPath('picture', personal_image.path),
      );
      request.files.add(
        await http.MultipartFile.fromPath('id_card_image', id_image.path),
      );
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      final respStr = await response.stream.bytesToString();

      final data = jsonDecode(respStr);

      if (data["status_code"] == 201) {
        isLoading = false;
        Get.offAll(() => LoginScreen());
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
      Get.snackbar(
        "Message",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
      );
    }
  }

  Future<void> logout() async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      var request = http.Request('GET', Uri.parse('$baseUrl/logout'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      final respStr = await response.stream.bytesToString();

      final data = jsonDecode(respStr);

      if (data['status_code'] == 200) {
        token = null;
        currentuser = null;
        Get.offAll(() => LoginScreen());
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
      Get.snackbar(
        "Message",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
      );
    }
  }
}
