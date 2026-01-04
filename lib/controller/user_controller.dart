
import 'package:get/get.dart';
import '../models/user.dart';
import '../providers/user_provider.dart';

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
      Get.snackbar("Error".tr,  'error_something_wrong'.tr);
    }
  }

  Future<void> approveUser(User user) async {
    try {
      await provider.approveuser(user);
      users.removeWhere((u) => u.id == user.id);
      users.refresh();
    } catch (e) {
      Get.snackbar("Error".tr,  'error_something_wrong'.tr);
    }
  }

  Future<void> rejectUser(User user) async {
    if (user.id == 1) {
      Get.snackbar("Error".tr,   'error_reject_admin'.tr);
    } else {
      try {
        await provider.rejectuser(user);
        users.removeWhere((u) => u.id == user.id);
        users.refresh();
      } catch (e) {
        Get.snackbar("Error".tr,  'error_something_wrong'.tr);
      }
    }
  }

  Future<void> getAllUsersisApprovedTrue() async {
    try {
      await provider.getAllUsersis_apprved_true();
      users.assignAll(UserProvider.users);
    } catch (e) {
      Get.snackbar("Error".tr,  'error_something_wrong'.tr);
    }
  }

  

}
