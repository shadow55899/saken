import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../service/booking_service.dart';

class BookingController extends GetxController {
  final BookingService service = BookingService();

  Rx<DateTime?> checkIn = Rx<DateTime?>(null);
  Rx<DateTime?> checkOut = Rx<DateTime?>(null);
  RxString paymentMethod = "".obs;

  /// Pick a date (check-in or check-out)
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

  /// Submit booking
  Future<void> submitBooking(int apartmentId) async {
    if (checkIn.value == null ||
        checkOut.value == null ||
        paymentMethod.value.isEmpty) {
      Get.snackbar("Error", "Please complete all fields");
      return;
    }

    final success = await service.createBooking(
      apartmentId: apartmentId,
      checkIn: checkIn.value!,
      checkOut: checkOut.value!,
      paymentMethod: paymentMethod.value,
    );

    if (success) {
      Get.back(); // close dialog
      Get.snackbar("Success", "Booking completed successfully");
    } else {
      Get.snackbar("Error", "Booking failed");
    }
  }
}
