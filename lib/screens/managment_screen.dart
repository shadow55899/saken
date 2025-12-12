// ignore_for_file: use_key_in_widget_constructors

import 'package:apartment/controller/auth_controller.dart';
import 'package:apartment/controller/login_controller.dart';
import 'package:apartment/controller/user_controller.dart';
import 'package:apartment/providers/user_provider.dart';
import 'package:apartment/screens/user_request_screen.dart';
import 'package:apartment/screens/user_remove_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManagmentScreen extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

  final UserController controller = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    final screenHight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    bool isMobile = screenHight > screenWidth;
    // double boxHeight;
    // double boxWidth;

    // if (isMobile) {
    //   boxHeight = screenHight * 0.30;
    //   boxWidth = screenWidth * 0.30 * 2;
    // } else {
    //   boxWidth = screenWidth * 0.25;
    //   boxHeight = screenWidth * 0.20 * 2;
    // }

    double titleSize = isMobile ? 25 : 50;
    double nameSize = isMobile ? 20 : 60;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Container(
            //     height: boxHeight,
            //     width: boxWidth,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(20),
            //       image: const DecorationImage(
            //         image: AssetImage("assets/images/logo.png"),
            //         fit: BoxFit.cover,
            //       ),
            //     ),
            //   ),
            // ),
            Text(
              "Hello again",
              style: TextStyle(
                fontSize: titleSize,
                fontWeight: FontWeight.bold,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 30),
              child: Text(
                Get.find<AuthController>().currentUser.value!.firstName +
                    " " +
                    Get.find<AuthController>().currentUser.value!.lastName,
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
                        SizedBox(
                          height: screenHight * 0.05,
                          width: screenWidth * 0.6,
                          child: ElevatedButton(
                            onPressed: () {
                              controller.getAllUsersisApprovedFalse();

                              Get.to(() => UserRequestScreen());
                            },
                            child: const Text(
                              "Registration Requests",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: SizedBox(
                            height: screenHight * 0.05,
                            width: screenWidth * 0.6,
                            child: ElevatedButton(
                              onPressed: () {
                                controller.getAllUsersisApprovedTrue();
                                Get.to(() => UserRemoveScreen());
                              },
                              child: Text(
                                "Delete Users",
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
                        SizedBox(
                          height: screenHight * 0.05,
                          width: screenWidth * 0.3,
                          child: ElevatedButton(
                            onPressed: () {
                              controller.getAllUsersisApprovedFalse();

                              Get.to(() => UserRequestScreen());
                            },
                            child: const Text(
                              "Registration Requests",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.05),
                        SizedBox(
                          height: screenHight * 0.05,
                          width: screenWidth * 0.3,
                          child: ElevatedButton(
                            onPressed: () {
                              controller.getAllUsersisApprovedTrue();
                              Get.to(() => UserRemoveScreen());
                            },
                            child: const Text(
                              "Delete Users",
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
