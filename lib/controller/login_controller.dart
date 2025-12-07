import 'package:apartment/models/providers/user_provider.dart';
import 'package:get/get.dart';

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
    isLoading.value = true;
    await provider.login(phone.value, password.value, isLoading.value);
    isLoading.value = false;
  }
}
