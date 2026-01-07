import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tapbar/controller/booking_edit_controller.dart';
import 'package:tapbar/controller/reservation_conroller.dart';
import 'package:tapbar/models/booking.dart';
import 'package:tapbar/widgets/rate.dart';
import 'package:intl/intl.dart';

class BookingScreen extends StatelessWidget {
  ReservationConroller controller = Get.put(ReservationConroller());

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(title: Text('Bookings'.tr)),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        if (controller.reservation.isEmpty) {
          return Center(
            child: Text("No bookings found".tr, style: TextStyle(fontSize: 18)),
          );
        }
        return ListView.builder(
          padding: EdgeInsets.all(12),
          itemCount: controller.reservation.length,
          itemBuilder: (context, index) {
            final booking = controller.reservation[index];
            return BookingCard(booking: booking, isDark: isDark);
          },
        );
      }),
    );
  }
}

class BookingCard extends StatelessWidget {
  final Booking booking;
  final bool isDark;

  const BookingCard({super.key, required this.booking, required this.isDark});

  Color statusColor(String? status) {
    switch (status) {
      case "pending":
        return Colors.orange;

      case "confirmed":
        return Colors.blue;

      case "cancelled":
      case "rejected":
        return Colors.red;

      case "completed":
        return Colors.green;

      case "payment_pending":
        return Colors.amber;

      case "checked_in":
        return Colors.teal;

      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: isDark ? Colors.grey[900] : Colors.white,
      child: InkWell(
        borderRadius: BorderRadius.circular(15), // match card shape
        onTap: () {
          if (booking.bookingStatus == "pending" ||
              booking.bookingStatus == "completed" ||
              booking.bookingStatus == "modified") {
            bool b = booking.bookingStatus == "completed" ? true : false;
            Get.dialog(
              BookingEditDialog(booking: booking, isRating: b),
              barrierDismissible: true,
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Booking".tr + "#${booking.id}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: statusColor(booking.bookingStatus),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      (booking.bookingStatus ?? "").tr,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                "Check-in Date".tr +
                    ":" +
                    "${BookingEditController.formatDate(booking.checkInDate)}",
                style: TextStyle(
                  color: isDark ? Colors.white70 : Colors.black87,
                ),
              ),
              Text(
                "Check-out Date".tr +
                    ":" +
                    "${BookingEditController.formatDate(booking.checkOutDate)}",
                style: TextStyle(
                  color: isDark ? Colors.white70 : Colors.black87,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Payment".tr + ":" + "${booking.paymentMethod}".tr,
                style: TextStyle(
                  color: isDark ? Colors.white70 : Colors.black87,
                ),
              ),
              const SizedBox(height: 10),
              if (booking.rate != null)
                Text(
                  "Rate".tr + ":" + "⭐ ${booking.rate}",
                  style: TextStyle(
                    color: isDark ? Colors.yellow : Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class BookingEditDialog extends StatelessWidget {
  final Booking booking;
  final bool isRating;

  const BookingEditDialog({
    super.key,
    required this.booking,
    required this.isRating,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final editController = Get.put(BookingEditController(booking));
    return isRating
        ? AlertDialog(
            title: Text(
              'Rate Booking'.tr,
              style: TextStyle(color: isDark ? Colors.white : Colors.black),
            ),

            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [Rate(booking: booking)],
              ),
            ),
          )
        : AlertDialog(
            title: Text(
              'Edit Booking'.tr,
              style: TextStyle(color: isDark ? Colors.white : Colors.black),
            ),

            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: editController.checkInController,
                    readOnly: true,
                    style: TextStyle(
                      color: isDark ? Colors.white : Colors.black,
                    ),
                    decoration: InputDecoration(
                      labelText: "Check-in Date".tr,
                      suffixIcon: IconButton(
                        icon: Icon(Icons.calendar_today),
                        onPressed: () => editController.pickDate(
                          editController.checkInController,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: editController.checkOutController,
                    readOnly: true,
                    style: TextStyle(
                      color: isDark ? Colors.white : Colors.black,
                    ),
                    decoration: InputDecoration(
                      labelText: "Check-out Date".tr,
                      suffixIcon: IconButton(
                        icon: Icon(Icons.calendar_today),
                        onPressed: () => editController.pickDate(
                          editController.checkOutController,
                        ),
                      ),
                    ),
                  ),
                  // const SizedBox(height: 20),
                  // Rate(booking: booking),
                ],
              ),
            ),
            actions: [
              TextButton(
                child: Text('cancel'.tr),
                onPressed: () {
                  editController.cancelBook();
                  Get.find<ReservationConroller>().getAllReservation();
                  Get.back();
                },
              ),
              TextButton(
                child: Text('Save'.tr),
                onPressed: () {
                  editController.save();
                  Get.find<ReservationConroller>().getAllReservation();
                },
              ),
            ],
          );
  }
}
