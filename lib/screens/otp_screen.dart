import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:tapbar/controller/otp_controller.dart';
import 'package:tapbar/widgets/themes.dart';

class OtpScreen extends StatelessWidget {
  OtpController controller = Get.put(OtpController());
  String phone_number = Get.arguments as String;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("verification".tr))),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("enter_verification_code".tr),
            Theme.of(context).brightness == Brightness.dark
                ? Directionality(
                    textDirection: TextDirection.ltr,
                    child: OtpTextField(
                      numberOfFields: 6,
                      showFieldAsBox: false,
                      autoFocus: true,
                      borderColor: Colors.white,
                      enabledBorderColor: Colors.white,
                      focusedBorderColor: Colors.white,
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      onCodeChanged: (String code) {},
                      onSubmit: (String verificationCode) {
                        controller.updateOtp(verificationCode);
                      },
                    ),
                  )
                : Directionality(
                    textDirection: TextDirection.ltr,
                    child: OtpTextField(
                      numberOfFields: 6,
                      showFieldAsBox: false,
                      autoFocus: true,
                      borderColor: Colors.black,
                      enabledBorderColor: Colors.black,
                      focusedBorderColor: Colors.black,
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      onCodeChanged: (String code) {},
                      onSubmit: (String verificationCode) {
                        controller.updateOtp(verificationCode);
                      },
                    ),
                  ),
            SizedBox(height: 50),
            Obx(() {
              if (controller.isLoading.value)
                return CircularProgressIndicator();
              return ElevatedButton(
                onPressed: () {
                  controller.verify_otp(phone_number);
                },
                child: Text("verify".tr),
              );
            }),
            SizedBox(height: 50),
            TextButton(
              onPressed: () {
                print(phone_number);
                controller.resend_otp(phone_number);
              },
              child: Text(
                "resend_code".tr,
                style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
