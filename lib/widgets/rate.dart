import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:get/get.dart';
import 'package:tapbar/controller/rate_controller.dart';
import 'package:tapbar/controller/reservation_conroller.dart';
import 'package:tapbar/models/booking.dart';
import 'package:tapbar/widgets/boxInformation.dart';

class Rate extends StatelessWidget {
  final RateController controller = Get.put(RateController());
  Booking booking;
  Rate({required this.booking});
  @override
  Widget build(BuildContext context) {
    controller.rate.value = booking.rate!;
    return Container(
      child: Obx(
        () => StarRating(
          rating: controller.rate.value.toDouble(),
          color: Colors.amberAccent,
          borderColor: Colors.black,
          starCount: 5,
          size: 40,
          onRatingChanged: (rating) {
            controller.rate.value = rating.toInt();
            controller.ratebook(booking.id, rating.toInt());
            Get.back();
            Get.find<ReservationConroller>().getAllReservation();
          },
        ),
      ),
    );
  }
}
