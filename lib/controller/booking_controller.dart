import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../service/booking_service.dart';

class BookingController extends GetxController {
  final BookingService service = BookingService();

  Rx<DateTime?> checkIn = Rx<DateTime?>(null);
  Rx<DateTime?> checkOut = Rx<DateTime?>(null);
  RxString paymentMethod = "".obs;

  Future<void> submitBooking(int apartmentId) async {
    if (checkIn.value == null ||
        checkOut.value == null ||
        paymentMethod.value.isEmpty) {
      Get.snackbar(
        "Missing Information",
        "Please select dates and payment method",
      );
      return;
    }

    final result = await service.createBooking(
      apartmentId: apartmentId,
      checkIn: checkIn.value!,
      checkOut: checkOut.value!,
      paymentMethod: paymentMethod.value,
    );

    if (result["success"] == true) {
      Get.back();
      Get.snackbar(
        "Booking Request sent Wait for Response",
        "Your booking Request has been completed",
      );
    } else {
      Get.snackbar(
        "Booking Failed",
        "Error ${result["statusCode"]}: ${result["message"]}",
      );
    }
  }
  Future<void> pickDate(BuildContext context, {required bool isStart}) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      if (isStart) {
        checkIn.value = picked;
      } else {
        checkOut.value = picked;
      }
    }
  }

}
