import 'dart:convert';

import 'package:get/instance_manager.dart';
import 'package:tapbar/controller/auth_controller.dart';
import 'package:tapbar/main.dart';
import 'package:tapbar/models/app_notification.dart';
import 'package:http/http.dart' as http;

class NotificationsProvider {
  static List<AppNotification> notifications = [];
  final String baseUrl = MyApp.baseUrl.value;
  final String? token = Get.find<AuthController>().userToken.value;

  Future<void> getAllNotofications() async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      var request = http.Request(
        'GET',
        Uri.parse('$baseUrl/notifications/all'),
      );

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      final respStr = await response.stream.bytesToString();
      final data = jsonDecode(respStr);
      // print(data);
      if (response.statusCode == 200) {
        print(data);
        // if (data["notifications"] == null) return [];
        // notifications = AppNotification.parseList(data["notifications"]);
      } else {
        // print(response.reasonPhrase);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
