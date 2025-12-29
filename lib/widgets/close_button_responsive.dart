import 'package:flutter/material.dart';

class CloseButtonResponsive extends StatelessWidget {
  final String label;

  final VoidCallback onPressed;

  const CloseButtonResponsive({
    super.key,
    this.label = "Close",

    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHight = MediaQuery.of(context).size.height;

    return Center(
      child: SizedBox(
        width: screenWidth * 0.9,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal,
            padding: EdgeInsets.symmetric(vertical: screenHight * 0.018),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              label,
              style: TextStyle(
                fontSize: ((screenWidth * 0.04) + (screenWidth * 0.008)).clamp(
                  14.0,
                  18.0,
                ),
                // color: const Color.fromARGB(255, 199, 53, 53),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
