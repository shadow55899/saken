
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/login_controller.dart';
import '../providers/user_provider.dart';
import 'register_screen.dart';

class LoginScreen extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());
  final UserProvider provider = UserProvider();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(title:  Text('login'.tr)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  isDark
                      ? 'assets/images/user2.png'
                      : 'assets/images/user.png',
                  width: 200,
                  height: 200,
                ),
                Text(
                  'welcome'.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                Text(
                  'login_to_account'.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(height: 15),
                isDark
                    ? TextFormField(
                        onChanged: (value) {
                          controller.phone.value = value;
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText:  'phone'.tr,
                          prefixIcon: Icon(Icons.phone),
                          border: OutlineInputBorder(
                            gapPadding: 20,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      )
                    : TextFormField(
                        onChanged: (value) {
                          controller.phone.value = value;
                        },
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                          color: Color(0xFF5A7867),
                        ),
                        decoration: InputDecoration(
                          labelText: 'phone'.tr,
                          labelStyle: const TextStyle(
                            color: Color(0xFF5A7867),
                          ),
                          prefixIcon: const Icon(
                            Icons.phone,
                            color: Color(0xFF5A7867),
                          ),
                          border: OutlineInputBorder(
                            gapPadding: 20,
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color(0xFF5A7867),
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              color: Color(0xFF5A7867),
                            ),
                          ),
                        ),
                      ),
                SizedBox(height: 15),
                Obx(() {
                  return TextFormField(
                    onChanged: (value) => controller.password.value = value,
                    obscureText: !controller.isPasswordVisible.value,
                    style: isDark
                        ? null
                        : const TextStyle(color: Color(0xFF5A7867)),
                    decoration: InputDecoration(
                      labelText:'password'.tr,
                      labelStyle:
                          isDark
                          ? null
                          : const TextStyle(color: Color(0xFF5A7867)),
                      prefixIcon: Icon(
                        Icons.password,
                        color: isDark
                            ? null
                            : const Color(0xFF5A7867),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            isDark
                            ? BorderSide.none
                            : const BorderSide(color: Color(0xFF5A7867)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: isDark
                              ? Theme.of(context).colorScheme.primary
                              : const Color(0xFF5A7867),
                        ),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.isPasswordVisible.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: isDark
                              ? null
                              : const Color(0xFF5A7867),
                        ),
                        onPressed: () {
                          controller.isPasswordVisible.toggle();
                        },
                      ),
                    ),
                  );
                }),
                Obx(() {
                  return Row(
                    children: [
                      Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) {
                          if (value != null) {
                            controller.rememberMe.value = value;
                          }
                        },
                      ),
                       Text('remember_me'.tr),
                      const Spacer(),
                    ],
                  );
                }),

                SizedBox(height: 15),
                Obx(() {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 75),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: controller.isLoading.value
                        ? null
                        : () async {
                            controller.isLoading.value = true;
                            await controller.login();
                            controller.isLoading.value = false;
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
                        :  Text('login'.tr),
                  );
                }),

                SizedBox(height: 15),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 75),
                    side: BorderSide(
                      color: isDark
                          ? Colors.white
                          : Colors.black,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    foregroundColor:
                        isDark
                        ? Colors.white
                        : Colors.black,
                    overlayColor:
                        isDark
                        ? Colors.white.withOpacity(0.1)
                        : const Color(
                            0xFF5A7867,
                          ).withOpacity(0.1),
                  ),
                  onPressed: () {
                    Get.to(() => RegisterScreen());
                  },
                  child:  Text(
                    'create_account'.tr,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
