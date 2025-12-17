
import 'package:flutter/material.dart';

class BoxInformation extends StatelessWidget {
  final String title;
  //final DateTime? datetime;
  final Widget value;


  const BoxInformation({
    super.key,
    required this.title,
    // required this.datetime,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double titleSizee=screenWidth*0.015;


    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 8.0),
      child: Container(
        width: screenWidth * 0.5,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 60, 84, 181),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: screenWidth * 0.3, 
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: titleSizee,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: value,
            ),
          ],
        ),

      ),
    );
  }}