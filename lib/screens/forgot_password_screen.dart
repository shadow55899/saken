import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tapbar/controller/otp_controller.dart';
import 'package:tapbar/screens/otp_screen.dart';

class ForgotPasswordScreen extends StatelessWidget {
  OtpController controller = Get.put(OtpController());
  String? phone_number;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(title: Text("forgot_password".tr)),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'please enter your phone number'.tr,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              onChanged: (value) => phone_number = value,
              decoration: InputDecoration(
                labelText: 'phone'.tr,
                prefixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
              style: TextStyle(
                      color: isDark ? Colors.white : Colors.black,
                    ),
            ),
            const SizedBox(height: 20),
            Obx(
              () => ElevatedButton(
                onPressed: () {
                  if (phone_number != null) {
                    controller.forgotPass(phone_number!);
                    Get.to(() => OtpScreen(), arguments: phone_number);
                  }
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
