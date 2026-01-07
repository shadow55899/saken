import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:tapbar/controller/otp_controller.dart';

class ChangePasswordScreen extends StatelessWidget {
  String password = "";
  String password_confimation = "";
  String? phone_number = Get.arguments as String?;
  OtpController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(title: Text("Change Password".tr)),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "please enter your new password".tr,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              style: TextStyle(color: isDark ? Colors.white : Colors.black),
              onChanged: (value) => password = value,
              decoration: InputDecoration(
                labelText: "new password".tr,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            TextFormField(
              style: TextStyle(color: isDark ? Colors.white : Colors.black),
              onChanged: (value) => password_confimation = value,
              decoration: InputDecoration(
                labelText: 'confirm_password'.tr,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Obx(
              () => ElevatedButton(
                onPressed: () {
                  controller.ResetPass(
                    password,
                    password_confimation,
                    phone_number,
                  );
                },
                child: controller.isLoading.value
                    ? const SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : Text("next".tr, style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
