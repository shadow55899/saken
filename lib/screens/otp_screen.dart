import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:tapbar/widgets/themes.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("verification"))),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Theme.of(context).brightness == Brightness.dark
                ? OtpTextField(
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
                    onSubmit: (String verificationCode) {},
                  )
                : OtpTextField(
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
                    onSubmit: (String verificationCode) {},
                  ),
            SizedBox(height: 50),
            ElevatedButton(onPressed: () {}, child: Text("verify")),
            SizedBox(height: 50),
            TextButton(
              onPressed: () {
                changeTheme();
              },
              child: Text(
                "Resend Code",
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
