import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget imagePickerButton({
  required String label,
  required File? image,
  required VoidCallback onPressed,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      minimumSize: const Size(150, 150),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    child: image == null
        ? Text(label, style: const TextStyle(color: Colors.white))
        : ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.file(
              image,
              height: 120,
              width: 120,
              fit: BoxFit.cover,
            ),
          ),
  );
}
