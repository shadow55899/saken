import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

enum Role { admin, apartment_owner, renter, none }

class RegisterController extends GetxController {
  var firstName = ''.obs;
  var lastName = ''.obs;
  var phoneNumber = ''.obs;
  var password = ''.obs;
  var personalImage = Rx<File?>(null);
  var idImage = Rx<File?>(null);
  var role = Role.none.obs;

  Future<void> pickImage(bool isPersonal, ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      if (isPersonal) {
        personalImage.value = File(pickedFile.path);
      } else {
        idImage.value = File(pickedFile.path);
      }
    }
  }

  var selectedDate = Rx<DateTime?>(null);

  var isLoading = false.obs;

  Future<void> register() async {
    try {
      isLoading.value = true;

      await Future.delayed(const Duration(seconds: 2));

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
