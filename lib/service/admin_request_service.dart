import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/flat.dart';
import '../models/requests_model.dart';
import '../models/user.dart';
import 'api_service.dart';

class AdminRequestService {
  final ApiService apiservice = ApiService();

  Future<List<User>> fetchRequests(String token) async {
    final response = await ApiService.get(
      "/users/isfalse",
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    print("Status code: ${response["status_code"]}");
    print("full respons: $response");

    if (response["status_code"] == 200 || response["status_code"] == 201) {
      final dataJson = response["data"];

      print("Status code: ${response["status_code"]} inside the 200 condition");
      if (dataJson != null && dataJson["users"] != null) {
        return User.parseUsers(response);

      } else {
        print("error response['data']['users'] not found");
        return [];
      }
    } else {
      print(" api error: ${response["status_code"]}");
      return [];
    }
  }
  Future<bool> acceptRequest(String token, int id) async {
    final response = await ApiService.put(
      "/users/$id/approve",
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    print("Status code: ${response["status_code"]}");
    print("FULL RESPONSE: $response");

    if (response["status_code"] == 200 || response["status_code"] == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> rejectRequest(String token, int id) async {
    final response = await ApiService.put(
      "/users/$id/reject",
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response["status_code"] == 200 || response["status_code"] == 201) {
      print("in service status 200");
      return true;
    } else {
      print("in service status  not 200");
      return false;
    }
  }
}
