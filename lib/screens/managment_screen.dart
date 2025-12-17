
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/auth_controller.dart';
import '../controller/login_controller.dart';
import '../controller/user_controller.dart';
import 'user_remove_screen.dart';
import 'user_request_screen.dart';

class ManagmentScreen extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

  final UserController controller = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    final screenHight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    bool isMobile = screenHight > screenWidth;
    double titleSize = isMobile ? 25 : 50;
    double nameSize = isMobile ? 20 : 60;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
      
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
