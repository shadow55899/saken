import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class RateController extends GetxController {
  var rate = 1.0.obs;
  var icon = Rx<IconData>(Icons.star_rate_outlined);

  void rateApp() {
    if (icon.value == Icons.star_rate_outlined) {
      icon.value = Icons.star;
    } else {
      icon.value = Icons.star_rate_outlined;
    }
  }
}
