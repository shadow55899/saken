import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:http/http.dart' as http;
import 'package:tapbar/controller/auth_controller.dart';
import 'package:tapbar/main.dart';
import 'package:tapbar/models/flat.dart';

class FavoriteProvider {
  static List<Flat> favoriteList = [];
  final String baseUrl = MyApp.baseUrl.value;
  final String? token = Get.find<AuthController>().userToken.value;

  Future<List<Flat>> getAllFavorite() async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

      var request = http.Request(
        'GET',
        Uri.parse('$baseUrl/apartment/favorites'),
      );

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      final respStr = await response.stream.bytesToString();
      final data = jsonDecode(respStr);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final list = data["data"];
        if (data != null) {
          favoriteList = Flat.parseList(list);
          return favoriteList;
        } else {
          favoriteList = [];
          return favoriteList;
        }
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
        return favoriteList;
      }
    } catch (e) {
      print(e.toString());
    } finally {
      return favoriteList;
    }
  }

  Future<void> addFavorite(int id) async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      var request = http.Request(
        'POST',
        Uri.parse('$baseUrl/apartment/$id/favorite'),
      );

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      final respStr = await response.stream.bytesToString();
      final data = jsonDecode(respStr);

      if (response.statusCode == 200) {
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

  Future<void> removeFavorite(int id) async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      var request = http.Request(
        'DELETE',
        Uri.parse('$baseUrl/apartment/$id/removeFavorite'),
      );

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      final respStr = await response.stream.bytesToString();
      final data = jsonDecode(respStr);

      if (data['status_code'] == 200) {
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
}
