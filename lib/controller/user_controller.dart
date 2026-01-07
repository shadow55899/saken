import 'package:get/get.dart';
import '../models/user.dart';
import '../providers/user_provider.dart';

class UserController extends GetxController {
  final UserProvider provider = UserProvider();
  RxBool isLoading = false.obs;
  final RxList<User> users = <User>[].obs;

  @override
  void onInit() {
    super.onInit();
    getAllUsersisApprovedFalse();
  }

  Future<void> getAllUsersisApprovedFalse() async {
    try {
      isLoading.value = true;
      await provider.getAllUsersis_apprved_false();
      users.assignAll(UserProvider.users);
      isLoading.value = false;
    } catch (e) {
      Get.snackbar("Error".tr, 'error_something_wrong'.tr);
    }
  }

  Future<void> approveUser(User user) async {
    try {
      isLoading.value = true;
      await provider.approveuser(user);
      users.removeWhere((u) => u.id == user.id);
      users.refresh();
      isLoading.value = false;
    } catch (e) {
      Get.snackbar("Error".tr, 'error_something_wrong'.tr);
    }
  }

  Future<void> rejectUser(User user) async {
    if (user.id == 1) {
      Get.snackbar("Error".tr, 'error_reject_admin'.tr);
    } else {
      try {
        isLoading.value = true;
        await provider.rejectuser(user);
        users.removeWhere((u) => u.id == user.id);
        users.refresh();
        isLoading.value = false;
      } catch (e) {
        Get.snackbar("Error".tr, 'error_something_wrong'.tr);
      }
    }
  }

  Future<void> getAllUsersisApprovedTrue() async {
    try {
      isLoading.value = true;
      await provider.getAllUsersis_apprved_true();
      users.assignAll(UserProvider.users);
      isLoading.value = false;
    } catch (e) {
      Get.snackbar("Error".tr, 'error_something_wrong'.tr);
    }
  }
}
