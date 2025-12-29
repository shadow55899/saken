import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../controller/auth_controller.dart';
import '../controller/register_controller.dart';
import '../main.dart';
import '../models/user.dart';
import '../screens/login_screen.dart';
import '../screens/main_screen.dart';

class UserProvider {
  final String baseUrl = MyApp.baseUrl.value;
  static String? token;
  static User? currentuser;
  static List<User> users = [];
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
      //print(respStr);
      final data = jsonDecode(respStr);
      if (response.statusCode == 200) {
        var userjson;
        userjson = data['data']['user'] ?? {};
        token = data['Token'] ?? '';
        currentuser = User.fromJson(userjson);
      }
      if (data['status_code'] == 200) {
        print(data);
        Get.find<AuthController>().login(token!, currentuser!);
        isLoading = false;
        currentuser = User.fromJson(data['data']['user']);
        Get.off(() => MainScreen());
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
      print(e.toString());
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
      print(e.toString());
    }
  }

  Future<void> logout() async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Get.find<AuthController>().userToken}',
      };
      var request = http.Request('GET', Uri.parse('$baseUrl/logout'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      final respStr = await response.stream.bytesToString();

      final data = jsonDecode(respStr);

      if (data['status_code'] == 200) {
        Get.find<AuthController>().logout();
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
      print(e.toString());
    }
  }

  Future<void> getAllUsersis_apprved_false() async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Get.find<AuthController>().userToken}',
      };
      var request = http.Request('GET', Uri.parse('$baseUrl/users/isfalse'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      final respStr = await response.stream.bytesToString();

      final data = jsonDecode(respStr);

      if (data['status_code'] == 200) {
        users = [];
        users = User.parseUsers(data);
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

  Future<void> approveuser(User user) async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Get.find<AuthController>().userToken}',
      };
      var request = http.Request(
        'PUT',
        Uri.parse('$baseUrl/users/${user.id}/approve'),
      );

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      final respStr = await response.stream.bytesToString();

      final data = jsonDecode(respStr);

      if (data['status_code'] == 200) {
        Get.snackbar(
          "Message",
          data["message"] + " " + user.firstName + " " + user.lastName,
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

  Future<void> rejectuser(User user) async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Get.find<AuthController>().userToken}',
      };
      var request = http.Request(
        'PUT',
        Uri.parse('$baseUrl/users/${user.id}/reject'),
      );

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      final respStr = await response.stream.bytesToString();

      final data = jsonDecode(respStr);

      if (data['status_code'] == 200) {
        Get.snackbar(
          "Message",
          data["message"] + " " + user.firstName + " " + user.lastName,
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

  Future<void> getAllUsersis_apprved_true() async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Get.find<AuthController>().userToken}',
      };
      var request = http.Request('GET', Uri.parse('$baseUrl/users/istrue'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      final respStr = await response.stream.bytesToString();

      final data = jsonDecode(respStr);

      if (data['status_code'] == 200) {
        users = [];
        users = User.parseUsers(data);
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

  Future<void> delete(String password) async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Get.find<AuthController>().userToken}',
      };
      var request = http.MultipartRequest(
        'DELETE',
        Uri.parse('$baseUrl/user/delete-account'),
      );
      request.fields.addAll({'password': password});

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      final respStr = await response.stream.bytesToString();

      print(respStr);

      final data = jsonDecode(respStr);

      if (data['status_code'] == 200) {
        Get.find<AuthController>().logout();
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
      print(e.toString());
    }
  }
}
