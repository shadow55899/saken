import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:tapbar/models/booking.dart';
import 'package:intl/intl.dart';
import 'package:tapbar/providers/booking_provider.dart';

class BookingEditController extends GetxController {
  final Booking booking;
  final provider = BookingProvider();
  BookingEditController(this.booking);

  late TextEditingController checkInController;
  late TextEditingController checkOutController;

  @override
  void onInit() {
    super.onInit();
    checkInController = TextEditingController(
      text: formatDate(booking.checkInDate),
    );
    checkOutController = TextEditingController(
      text: formatDate(booking.checkOutDate),
    );
  }

  static String formatDate(String? dateStr) {
    if (dateStr == null) return "";
    try {
      final parsed = DateTime.parse(dateStr);
      return DateFormat('yyyy-MM-dd').format(parsed);
    } catch (_) {
      return dateStr.split(" ").first;
    }
  }

  Future<void> pickDate(TextEditingController controller) async {
    final initialDate = DateTime.tryParse(controller.text) ?? DateTime.now();
    final picked = await showDatePicker(
      context: Get.context!,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      controller.text = DateFormat('yyyy-MM-dd').format(picked);
    }
  }

  void save() async {
    booking.checkInDate = checkInController.text;
    booking.checkOutDate = checkOutController.text;
    Get.back();
    await updateBook(booking.checkInDate, booking.checkOutDate);
  }

  Future<void> updateBook(
    String? updatedCheckInDate,
    String? updatedCheckOutDate,
  ) async {
    try {
      await provider.UpdateBook(
        updatedCheckInDate!,
        updatedCheckOutDate!,
        booking.id,
      );
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> cancelBook() async {
    try {
      await provider.CancelBook(booking.id);
    } catch (e) {
      print(e.toString());
    }
  }
}
