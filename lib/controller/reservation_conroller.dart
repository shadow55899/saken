import 'package:get/get.dart';
import 'package:tapbar/providers/booking_provider.dart';

class ReservationConroller extends GetxController {
  var reservation = [].obs;
  RxBool isLoading = false.obs;
  BookingProvider provider = BookingProvider();
  @override
  void onInit() {
    super.onInit();
    getAllReservation();
  }

  Future<void> getAllReservation() async {
    try {
      isLoading.value = true;
      reservation.value = await provider.getAllReservation();
      isLoading.value = false;
    } catch (e) {
      Get.snackbar("Error", "Something went wrong");
    }
  }
}
