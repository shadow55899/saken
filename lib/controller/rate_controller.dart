import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:tapbar/providers/booking_provider.dart';

class RateController extends GetxController {
  BookingProvider provider = BookingProvider();
  RxInt rate = 1.obs;
  Future<void> ratebook(int id, int rate) async {
    try {
      await provider.rateBook(id, rate);
    } catch (e) {
      print(e.toString());
    }
  }
}
