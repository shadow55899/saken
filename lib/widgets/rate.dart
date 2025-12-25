import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:get/get.dart';
import 'package:tapbar/controller/rate_controller.dart';

class Rate extends StatelessWidget {
  final RateController controller = Get.put(RateController());
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      child: Obx(
        () => StarRating(
          rating: controller.rate.value,
          color: Colors.amberAccent,
          borderColor: Colors.black,
          starCount: 5,
          size: 40,
          onRatingChanged: (rating) {
            controller.rate.value = rating;
          },
        ),
      ),
    );
  }
}
