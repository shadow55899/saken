import 'package:apartment/models/user.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  final box = GetStorage();
  var isLoggedIn = false.obs;
  var currentUser = Rxn<User>();
  var userToken = ''.obs;

  @override
  void onInit() {
    super.onInit();
    String? token = box.read('token');
    if (token != null && token.isNotEmpty) {
      userToken.value = token;
      isLoggedIn.value = true;
    }
  }

  void login(String token, User user) {
    userToken.value = token;
    currentUser.value = user;
    isLoggedIn.value = true;
    box.write('token', token);
  }

  void logout() {
    userToken.value = '';
    currentUser.value = null;
    isLoggedIn.value = false;
    box.remove('token');
  }
}
