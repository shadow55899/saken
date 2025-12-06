import 'package:get/get.dart';

class LoginController extends GetxController {
  final phone = ''.obs;
  final password = ''.obs;
  final rememberMe = false.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

}
