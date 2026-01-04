import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'close_button_responsive.dart';

class RoomApply extends StatelessWidget {
  final String title;
  final String Label;
  final RxDouble Value;
  final VoidCallback onApply;

  // Use TextEditingController outside build
  final TextEditingController roomController = TextEditingController();


  RoomApply({
    required this.title,
    required this.Label,
    required this.Value,
    required this.onApply,
  }) {
    roomController.text = Value.value.toString();

  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 🔹 Title
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            "${title} ",
            style: TextStyle(
              fontSize: screen.width * 0.04,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
          ),
        ),

   TextField(
            controller: roomController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: Label,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            //  prefixIcon: const Icon(Icons.arrow_upward, color: Colors.teal),
            ),
            onChanged: (val) {
              final parsed = double.tryParse(val);
              if (parsed != null) Value.value = parsed;
            },
          ),
        const SizedBox(height: 20),

        // 🔹 Max Value

        // 🔹 Buttons
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: CloseButtonResponsive(
                label:'apply'.tr ,
                onPressed: onApply, // pass the callback from parent
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: CloseButtonResponsive(
                label: "close".tr,
                onPressed: () => Get.back(), // just closes bottom sheet
              ),
            ),
          ],
        ),
      ],
    );
  }
}