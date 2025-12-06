import 'package:get/get.dart';
import '../services/api.dart';

class UserController extends GetxController {
  var isLoading = false.obs;
  var token = ''.obs;

  Future<void> register(Map<String, String> data) async {
    try {
      isLoading.value = true;
      final res = await Api.post(
        "register",
        data,
        null,
      ); // ✅ add null for headers
      Get.snackbar("Register", res["message"] ?? "Unknown error");
    } catch (e) {
      Get.snackbar("Register Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> login(String phone, String password) async {
    try {
      isLoading.value = true;
      final res = await Api.post("login", {
        "phone_number": phone,
        "password": password,
      }, null); // ✅ add null for headers
      if (res["Token"] != null) {
        token.value = res["Token"];
        Get.snackbar("Login", "Success");
      } else {
        Get.snackbar("Login", res["message"] ?? "Failed");
      }
    } catch (e) {
      Get.snackbar("Login Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    try {
      isLoading.value = true;
      final res = await Api.post("logout", {}, {
        "Authorization": "Bearer ${token.value}",
      }); // ✅ pass headers as third positional argument
      Get.snackbar("Logout", res["message"] ?? "Done");
      token.value = '';
    } catch (e) {
      Get.snackbar("Logout Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
