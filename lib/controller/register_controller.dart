import 'dart:io';

import 'package:get/get.dart';

class RegisterController extends GetxController {
  var firstName = ''.obs;
  var lastName = ''.obs;
  var phoneNumber = ''.obs;
  var password = ''.obs;

  var personalImage = Rx<File?>(null);
  var idImage = Rx<File?>(null);

  var selectedDate = Rx<DateTime?>(null);

  var isLoading = false.obs;

  Future<void> register() async {
    if (firstName.isEmpty ||
        lastName.isEmpty ||
        phoneNumber.isEmpty ||
        password.isEmpty ||
        personalImage.value == null ||
        idImage.value == null ||
        selectedDate.value == null) {
      Get.snackbar("Error", "Please fill all fields");
      return;
    }
    try {
      isLoading.value = true; // start loading

      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));
      // ✅ Success
      Get.snackbar("Success", "User registered successfully!");

      print("First name: ${firstName.value}");
      print("Personal image path: ${personalImage.value!.path}");
      print("Date: ${selectedDate.value}");
    } catch (e) {
      Get.snackbar("Error", "Something went wrong");
    } finally {
      isLoading.value = false; // stop loading
    }
  }
}
