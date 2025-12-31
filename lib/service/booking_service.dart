import 'package:get/get.dart';
import '../controller/auth_controller.dart';
import '../service/api_service.dart';
class BookingService {
  Future<Map<String, dynamic>> createBooking({
    required int apartmentId,
    required DateTime checkIn,
    required DateTime checkOut,
    required String paymentMethod,
  }) async {
    try {
      final token = Get.find<AuthController>().userToken;

      final response = await ApiService.post(
        "/bookings",
        {
          "apartment_id": apartmentId,
          "check_in_date": checkIn.toIso8601String(),
          "check_out_date": checkOut.toIso8601String(),
          "payment_method": paymentMethod,
        },
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        },
      );

      // ✅ PRINT EVERYTHING CLEARLY
      print("========== BOOKING API RESPONSE ==========");
      print("Status Code: ${response["status_code"]}");
      print("Response Body: $response");
      print("==========================================");

      return {
        "success": response["status_code"] == 200 ||
            response["status_code"] == 201,
        "statusCode": response["status_code"],
        "message": response["message"] ?? "No message from server",
      };
    } catch (e, stack) {
      print("❌ BOOKING API ERROR");
      print("Error: $e");
      print("StackTrace: $stack");

      return {
        "success": false,
        "statusCode": 500,
        "message": "Internal error occurred",
      };
    }
  }
}
