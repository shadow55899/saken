import 'package:get/get.dart';
import '../controller/auth_controller.dart';
import '../service/api_service.dart';

class BookingService {
  Future<bool> createBooking({
    required int apartmentId,
    required DateTime checkIn,
    required DateTime checkOut,
    required String paymentMethod,
  }) async {
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

    return response["status_code"] == 200 || response["status_code"] == 201;
  }
}
