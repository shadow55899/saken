import 'package:apartment/models/user.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  final box = GetStorage();

  var isLoggedIn = false.obs;
  var userToken = ''.obs;
  var currentUser = Rxn<User>(); // nullable reactive user

  @override
  void onInit() {
    super.onInit();

    // Restore token
    String? token = box.read('token');
    if (token != null && token.isNotEmpty) {
      userToken.value = token;
      isLoggedIn.value = true;
    }

    // Restore user
    Map<String, dynamic>? userJson = box.read('user');
    if (userJson != null) {
      currentUser.value = User.fromJson(userJson);
    }
  }

  void login(String token, User user) {
    userToken.value = token;
    isLoggedIn.value = true;
    currentUser.value = user;

    // Persist both
    box.write('token', token);
    box.write('user', user.toJson()); // must save as Map<String,dynamic>
  }

  void logout() {
    userToken.value = '';
    isLoggedIn.value = false;
    currentUser.value = null;

    box.remove('token');
    box.remove('user');
  }
}
