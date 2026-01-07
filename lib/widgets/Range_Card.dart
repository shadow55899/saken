import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'close_button_responsive.dart';

class RangeCard extends StatelessWidget {
  final String title;
  final String minLabel;
  final String maxLabel;
  final RxDouble minValue;
  final RxDouble maxValue;
  final VoidCallback onApply;

  final TextEditingController minController = TextEditingController();
  final TextEditingController maxController = TextEditingController();

  RangeCard({
    super.key,
    required this.title,
    required this.minLabel,
    required this.maxLabel,
    required this.minValue,
    required this.maxValue,
    required this.onApply,
  }) {
    minController.text = minValue.value.toString();
    maxController.text = maxValue.value.toString();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screen = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            "${title}",
            style: TextStyle(
              fontSize: screen.width * 0.04,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
          ),
        ),

        // 🔹 Min Value
        TextField(
          style: TextStyle(color: isDark ? Colors.white : Colors.black),
          controller: minController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: minLabel,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            prefixIcon: const Icon(Icons.arrow_upward, color: Colors.teal),
          ),
          onChanged: (val) {
            final parsed = double.tryParse(val);
            if (parsed != null) minValue.value = parsed;
          },
        ),

        const SizedBox(height: 20),

        TextField(
          style: TextStyle(color: isDark ? Colors.white : Colors.black),
          controller: maxController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: maxLabel,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            prefixIcon: const Icon(Icons.arrow_downward, color: Colors.teal),
          ),
          onChanged: (val) {
            final parsed = double.tryParse(val);
            if (parsed != null) maxValue.value = parsed;
          },
        ),
        const SizedBox(height: 20),

        // 🔹 Buttons
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: CloseButtonResponsive(
                label: "apply".tr,
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
