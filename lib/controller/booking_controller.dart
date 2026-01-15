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
      Get.snackbar("Error".tr, 'missing_info'.tr);
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
      Get.snackbar("success".tr, 'booking_request_sent'.tr);
    } else {
      Get.snackbar(
        "Booking Failed".tr,
        "Error ${result["statusCode"]}: ${result["message"]}",
      );
    }
  }

  Future<void> pickDate(BuildContext context, {required bool isStart}) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day + 1,
      ),
      firstDate: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day + 1,
      ),
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
