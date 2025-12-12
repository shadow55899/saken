import 'package:apartment/models/user.dart';
import 'package:apartment/providers/user_provider.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final UserProvider provider = UserProvider();

  final RxList<User> users = <User>[].obs;

  @override
  void onInit() {
    super.onInit();
    getAllUsersisApprovedFalse();
  }

  Future<void> getAllUsersisApprovedFalse() async {
    try {
      await provider.getAllUsersis_apprved_false();
      users.assignAll(UserProvider.users);
    } catch (e) {
      Get.snackbar("Error", "Something went wrong");
    }
  }

  Future<void> approveUser(User user) async {
    try {
      await provider.approveuser(user);
      users.removeWhere((u) => u.id == user.id);
      users.refresh();
    } catch (e) {
      Get.snackbar("Error", "Something went wrong");
    }
  }

  Future<void> rejectUser(User user) async {
    if (user.id == 1) {
      Get.snackbar("Error", "You can't reject admin");
    } else {
      try {
        await provider.rejectuser(user);
        users.removeWhere((u) => u.id == user.id);
        users.refresh();
      } catch (e) {
        Get.snackbar("Error", "Something went wrong");
      }
    }
  }

  Future<void> getAllUsersisApprovedTrue() async {
    try {
      await provider.getAllUsersis_apprved_true();
      users.assignAll(UserProvider.users);
    } catch (e) {
      Get.snackbar("Error", "Something went wrong");
    }
  }
}
