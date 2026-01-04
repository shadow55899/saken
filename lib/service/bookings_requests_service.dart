import 'dart:convert';
import 'package:get/get.dart';
import '../models/booking.dart';
import 'api_service.dart';

class BookingsRequestsService {
  final ApiService apiService = ApiService();

  // fetch all unconfirmed bookings
  Future<List<Booking>> fetchRequests(String token) async {
    final response = await ApiService.get(
      "/bookings/unconfirmed/all",
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    print("Status code: ${response["status_code"]}");
    print("Full response: $response");

    if (response["status_code"] == 200 || response["status_code"] == 201) {
      final dataJson = response["body"]["bookings"]; // <-- note the "body"

      if (dataJson != null) {
        return (dataJson as List)
            .map((bookingJson) => Booking.fromJson(bookingJson))
            .toList();
      } else {
        print("Error: 'bookings' not found in response");
        return [];
      }
    } else {
      print("API error: ${response["status_code"]}");
      return [];
    }
  }

  // accept a booking request
  Future<bool> acceptRequest(String token, int id) async {
    final response = await ApiService.put(
      "/bookings/$id/confirm",
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    print("Accept booking response: $response");

    return response["status_code"] == 200 || response["status_code"] == 201;
  }

  // reject a booking request
  Future<bool> rejectRequest(String token, int id) async {
    final response = await ApiService.put(
      "/bookings/$id/reject",
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    print("Reject booking response: $response");

    return response["status_code"] == 200 || response["status_code"] == 201;
  }
}
