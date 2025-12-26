

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../models/requests_model.dart';
import '../models/user.dart';
import '../providers/user_provider.dart';
import '../service/admin_request_service.dart';

class AdminRequestController extends GetxController {
  AdminRequestService adminService = AdminRequestService();
  var isLoading = false.obs;
  List<User> RequestList = [];
  @override
  void onInit() {
    super.onInit();
  }

  @override
  Future onReady() async {
    try {
      isLoading.value = true;
      RequestList = await adminService.fetchRequests("${UserProvider.token}");

      print(" Requests Loaded: ${RequestList.length}");
      print(" Requests Loaded: ${RequestList}");
    } catch (e) {
      print("error in onReady: $e");
      Get.snackbar("Error", "Something went wrong");
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> rejectRequest(int id) async {
    try {
      print("in controller try ");
      isLoading.value = true;
      bool success = await adminService.rejectRequest(
        "${UserProvider.token}",
        id,
      );
      return success;
    } catch (e) {
      print("error in Reject request in controller: $e");
      Get.snackbar("Error", "Something went wrong");
      return false;
    } finally {
      print("in finally");
      isLoading.value = false;
    }
  }

  Future<bool> acceptRequest(int id) async {
    try {
      isLoading.value = true;
      bool success = await adminService.acceptRequest(
        "${UserProvider.token}",
        id,
      );
      return success;
    } catch (e) {
      print("Error in accept request in controller: $e");
      Get.snackbar("Error", "Something went wrong");
      return false;
    } finally {
      isLoading.value = false;
    }
  }
}
