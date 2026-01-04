import 'package:get/get.dart';
import 'package:tapbar/controller/auth_controller.dart';
import 'package:tapbar/models/booking.dart';
import 'package:tapbar/service/bookings_requests_service.dart';
import '../providers/user_provider.dart';

class BookingsRequestsController extends GetxController {
  final BookingsRequestsService bookingsRequestsService =
  BookingsRequestsService();

  var isLoading = false.obs;
  List<Booking> requestList = [];

  @override
  void onReady() async {
    super.onReady();
    await loadRequests();
  }

  Future<void> loadRequests() async {
    try {
      AuthController authController = Get.find<AuthController>();

      isLoading.value = true;
      requestList = await bookingsRequestsService.fetchRequests("${authController.userToken}");

      print("Bookings loaded: ${requestList.length}");
    } catch (e) {
      print("Error loading bookings: $e");
      Get.snackbar("Error", "Something went wrong");
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> rejectRequest(int id) async {
    try {
      isLoading.value = true;
      final token = "${UserProvider.token}";
      final success = await bookingsRequestsService.rejectRequest(token, id);
      if (success) {
        requestList.removeWhere((booking) => booking.id == id);
      }
      return success;
    } catch (e) {
      print("Error rejecting booking: $e");
      Get.snackbar("Error".tr,    'error_something_wrong'.tr);
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> acceptRequest(int id) async {
    try {
      isLoading.value = true;
      final token = "${UserProvider.token}";
      final success = await bookingsRequestsService.acceptRequest(token, id);
      if (success) {
        requestList.removeWhere((booking) => booking.id == id);
      }
      return success;
    } catch (e) {
      print("Error accepting booking: $e");
      Get.snackbar("Error".tr,    'error_something_wrong'.tr);
      return false;
    } finally {
      isLoading.value = false;
    }
  }
}
