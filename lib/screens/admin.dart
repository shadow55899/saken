
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

import '../controller/user_controller.dart';
import 'admin_registratin_request.dart';
import 'user_remove_screen.dart';

class Admin extends StatelessWidget {
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

    double titleSize = screenWidth * 0.017;
    double nameSize = screenWidth * 0.017;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
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
                      image: AssetImage("assets/images/admin.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              Text(
               'welcome'.tr ,
                style: TextStyle(
                  fontSize: titleSize,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 30),
                child: Text(
                  'admin'.tr,
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
                            child: MaterialButton(
                              color: Colors.grey,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              onPressed: () {
                                Get.to(() => AdminRegistratinRequest());
                              },
                              child:  Text(
                                'registration_request'.tr ,
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: Container(
                              height: screenHight * 0.05,
                              width: screenWidth * 0.6,
                              child: MaterialButton(
                                color: Colors.grey,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                onPressed: () {
                                  Get.put(UserController());
                                  Get.to(() => UserRemoveScreen());
                                },
                                child: Text(
                                  'delete_requests'.tr,
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
                            child: MaterialButton(
                              color: Colors.grey,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              onPressed: () {
                                Get.to(() => AdminRegistratinRequest());
                              },
                              child:  Text(
                                'registration_request'.tr,
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.05),
                          Container(
                            height: screenHight * 0.05,
                            width: screenWidth * 0.3,
                            child: MaterialButton(
                              color: Colors.grey,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              onPressed: () {
                                Get.put(UserController());
                                Get.to(() => UserRemoveScreen());
                              },
                              child:  Text(
                                  'delete_requests'.tr,
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
      ),
    );
  }
}
