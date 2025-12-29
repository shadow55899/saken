
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/booking_controller.dart';

class BookingDialog extends StatelessWidget {
  final int flatId;

  BookingDialog({required this.flatId, super.key});
  final BookingController controller = Get.find<BookingController>();


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Book Apartment",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          // Check-in
          ListTile(
            title: Obx(
                  () => Text(
                controller.checkIn.value == null
                    ? "Select check-in date"
                    : controller.checkIn.value!.toString().split(" ").first,
              ),
            ),
            trailing: const Icon(Icons.date_range),
            onTap: () => controller.pickDate(context, isStart: true),
          ),

          // Check-out
          ListTile(
            title: Obx(
                  () => Text(
                controller.checkOut.value == null
                    ? "Select check-out date"
                    : controller.checkOut.value!.toString().split(" ").first,
              ),
            ),
            trailing: const Icon(Icons.date_range),
            onTap: () => controller.pickDate(context, isStart: false),
          ),

          const SizedBox(height: 10),

          // Payment Method
          Obx(
                () => DropdownButtonFormField<String>(
              value: controller.paymentMethod.value.isEmpty
                  ? null
                  : controller.paymentMethod.value,
              hint: const Text("Select payment method"),
              items: const [
                DropdownMenuItem(
                  value: "bank_transfer",
                  child: Text("Bank Transfer"),
                ),
                DropdownMenuItem(value: "cash", child: Text("Cash")),
                DropdownMenuItem(
                  value: "digital_wallet",
                  child: Text("Digital Wallet"),
                ),
                DropdownMenuItem(value: "credit", child: Text("Credit Card")),
              ],
              onChanged: (val) => controller.paymentMethod.value = val!,
            ),
          ),

          const SizedBox(height: 20),

          ElevatedButton(
            onPressed: () => controller.submitBooking(flatId),
            child: const Text("Confirm Booking"),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}