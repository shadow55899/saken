import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ManagmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    double boxHeight;
    double boxWidth;

    bool isMobile = screenHight > screenWidth;

    if (isMobile) {
      boxHeight = screenHight * 0.30;
      boxWidth = screenWidth * 0.30;
    } else {
      boxWidth = screenWidth * 0.25;
      boxHeight = screenWidth * 0.20;
    }

    double titleSize = isMobile ? 25 : 50;
    double nameSize = isMobile ? 20 : 60;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: boxHeight,
                width: boxWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: AssetImage("asset/images/logo.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            Text(
              "مرحباً بعودتك",
              style: TextStyle(
                fontSize: titleSize,
                fontWeight: FontWeight.bold,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 30),
              child: Text(
                "غزل سعيد",
                style: TextStyle(
                  fontSize: nameSize,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            isMobile
                ? Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: Column(
                      children: [
                        Container(
                          height: screenHight * 0.05,
                          width: screenWidth * 0.6,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.toNamed('/adminRR');
                            },
                            child: const Text(
                              "طلبات التسجيل",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: Container(
                            height: screenHight * 0.05,
                            width: screenWidth * 0.6,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                "حذف طلبات",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: screenWidth * 0.16),
                        Container(
                          height: screenHight * 0.05,
                          width: screenWidth * 0.3,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.toNamed('/adminRR');
                            },
                            child: const Text(
                              "طلبات التسجيل",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.05),
                        Container(
                          height: screenHight * 0.05,
                          width: screenWidth * 0.3,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text(
                              "حذف طلبات",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
