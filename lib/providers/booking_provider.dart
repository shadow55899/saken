import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:http/http.dart' as http;
import 'package:tapbar/controller/auth_controller.dart';
import 'package:tapbar/controller/favorite_controller.dart';
import 'package:tapbar/main.dart';
import 'package:tapbar/models/booking.dart';
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
          "Thanks for rating us please refresh your page to see the changes",
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

  // Future<void> payFlat(int id) async {
  //   try {
  //     var headers = {
  //       'Accept': 'application/json',
  //       'Authorization': 'Bearer $token',
  //     };
  //     var request = http.Request('PUT', Uri.parse('$baseUrl/bookings/$id/pay'));

  //     request.headers.addAll(headers);

  //     http.StreamedResponse response = await request.send();

  //     if (response.statusCode == 200) {
  //       Get.snackbar(
  //         "Message",
  //         "Thanks for rating us",
  //         snackPosition: SnackPosition.BOTTOM,
  //         backgroundColor: Colors.black.withOpacity(0.5),
  //         colorText: Colors.white,
  //         margin: EdgeInsets.all(8),
  //         borderRadius: 8,
  //         duration: Duration(seconds: 2),
  //         snackStyle: SnackStyle.FLOATING,
  //       );
  //     } else {
  //       print(response.reasonPhrase);
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  Future<List<Booking>> getAllReservation() async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      var request = http.Request('GET', Uri.parse('$baseUrl/bookings'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      final respStr = await response.stream.bytesToString();
      final data = jsonDecode(respStr);
      // print(data);
      if (response.statusCode == 200) {
        // print(data);
        if (data["bookings"] == null) return [];
        return Booking.parseList(data["bookings"]);
      } else {
        // print(response.reasonPhrase);
        return [];
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<void> UpdateBook(
    String updatedCheckInDate,
    String updatedCheckOutDate,
    int id,
  ) async {
    try {
      var request = http.MultipartRequest(
        'PUT',
        Uri.parse('$baseUrl/bookings/$id'),
      );
      request.fields.addAll({
        'check_in_date': updatedCheckInDate,
        'check_out_date': updatedCheckOutDate,
      });
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      final respStr = await response.stream.bytesToString();

      final data = jsonDecode(respStr);

      if (response.statusCode == 200) {
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
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> CancelBook(int id) async {
    try {
      var request = http.MultipartRequest(
        'DELETE',
        Uri.parse('$baseUrl/bookings/$id'),
      );
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      final respStr = await response.stream.bytesToString();

      final data = jsonDecode(respStr);

      if (response.statusCode == 200) {
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
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> rateBook(int id, int rate) async {
    try {
      var request = http.MultipartRequest(
        'PUT',
        Uri.parse('$baseUrl/bookings/$id/rate?rate=$rate'),
      );
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      final respStr = await response.stream.bytesToString();

      final data = jsonDecode(respStr);

      if (response.statusCode == 200) {
        Get.snackbar(
          "Message",
          "Thanks for rating us please refresh your page to see the changes",
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
