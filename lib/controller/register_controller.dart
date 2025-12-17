import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tapbar/providers/user_provider.dart';

enum Role { admin, apartment_owner, renter }

class RegisterController extends GetxController {
  var firstName = ''.obs;
  var lastName = ''.obs;
  var phoneNumber = ''.obs;
  var password = ''.obs;
  var selectedDate = Rx<DateTime?>(null);
  var role = Role.apartment_owner.obs;
  var personalImage = Rx<File?>(null);
  var idImage = Rx<File?>(null);
  var isLoading = false.obs;
  UserProvider provider = UserProvider();

  @override
  void onInit() {
    super.onInit();
  }

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

  Future<void> register() async {
    try {
      isLoading.value = true;
      await provider.register(
        firstName.value,
        lastName.value,
        phoneNumber.value,
        password.value,
        password.value,
        isLoading.value,
        selectedDate.value!,
        personalImage.value!,
        idImage.value!,
        role.value,
      );
    } catch (e) {
      Get.snackbar("Error", "Something went wrong");
    } finally {
      isLoading.value = false;
    }
  }
}
