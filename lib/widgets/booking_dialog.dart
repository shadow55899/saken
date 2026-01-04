
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
          Text(
         'book_apartment'.tr,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          // Check-in
          ListTile(
            title: Obx(
                  () => Text(
                controller.checkIn.value == null
                    ?   'select_check_in_date'.tr
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
                    ?   'select_check_out_date'.tr
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
              hint:  Text('select_payment_method'.tr),
              items:  [
                DropdownMenuItem(
                  value: "bank_transfer",
                  child: Text( 'payment_bank_transfer'.tr),
                ),
                DropdownMenuItem(value: "cash", child: Text( 'payment_cash'.tr)),
                DropdownMenuItem(
                  value: "digital_wallet",
                  child: Text(  'payment_digital_wallet'.tr),
                ),
                DropdownMenuItem(value: "credit", child: Text(  'payment_credit_card'.tr)),
              ],
              onChanged: (val) => controller.paymentMethod.value = val!,
            ),
          ),

          const SizedBox(height: 20),

          ElevatedButton(
            onPressed: () => controller.submitBooking(flatId),
            child:  Text( 'confirm_booking'.tr),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}