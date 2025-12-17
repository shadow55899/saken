
import 'package:get/get.dart';
import 'package:tapbar/providers/user_provider.dart';

class LoginController extends GetxController {
  final phone = ''.obs;
  final password = ''.obs;
  final rememberMe = false.obs;
  var isLoading = false.obs;
  var isPasswordVisible = false.obs;
  final UserProvider provider = UserProvider();

  @override
  void onInit() {
    super.onInit();
  }

  Future login() async {
    try {
      isLoading.value = true;
      await provider.login(phone.value, password.value, isLoading.value);
    } catch (e) {
      Get.snackbar("Error", "Something went wrong");
    } finally {
      isLoading.value = false;
    }
  }

  Future logout() async {
    try {
      await provider.logout();
    } catch (e) {
      Get.snackbar("Error", "Something went wrong");
    }
  }
}
