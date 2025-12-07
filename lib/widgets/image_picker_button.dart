import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

Widget imagePickerButton({
  required String label,
  required Rx<File?> image,
  required VoidCallback onPressed,
}) {
  return Obx(() {
    return Column(
      children: [
        ElevatedButton(onPressed: onPressed, child: Text(label)),
        const SizedBox(height: 8),
        image.value == null
            ? const Text("No image selected")
            : Image.file(
                image.value!,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
      ],
    );
  });
}
