import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:tapbar/service/my_apartment_service.dart';

import '../models/flat.dart';
import '../service/api_service.dart';
import 'auth_controller.dart';

class MyApartmentController extends GetxController {

  RxList<Flat> flat = <Flat>[].obs;
  final ApiService apiservice = new ApiService();
  MyApartmentService service = MyApartmentService();
  final List<Flat> mockFlats = [

    Flat(
      id: 1,
      area: 156,
      rooms: 1,
      livingRooms: 1,
      bathrooms: 2,
      rentalPrice: 111111,
      governorate: "Homs",
      city: "Al-Mokhaiam",
      address:
      "61458 Brock Springs Suite 398\nEast Margaritaton, CT 82919-6306",
      status: "Booked",
      averageRate: 2.12,
      owner: "Evert O'Conner",
      description: "Rerum sed quidem et recusandae soluta est sit.",
      pictures: [],
    ),    Flat(
      id: 1,
      area: 156,
      rooms: 1,
      livingRooms: 1,
      bathrooms: 2,
      rentalPrice: 111111,
      governorate: "Homs",
      city: "Al-Mokhaiam",
      address:
      "61458 Brock Springs Suite 398\nEast Margaritaton, CT 82919-6306",
      status: "Booked",
      averageRate: 2.12,
      owner: "Evert O'Conner",
      description: "Rerum sed quidem et recusandae soluta est sit.",
      pictures: [],
    ),
  ];


    @override
  void onReady() {
    super.onReady();
    loadApartments();
  }
  RxBool isLoading = true.obs;
  Future<void> loadApartments() async {
    AuthController authController = Get.find<AuthController>();
    try {
      isLoading.value = true;
      flat.assignAll(await service.fetchownerFlats("${authController.userToken}"));
      print(" Requests Loaded: ${flat.length}");
    } catch (e) {
      print ("i am in excepiton");
      print(e);
      flat.assignAll(mockFlats);
    //  Get.snackbar("Offline Mode", "Using mock data because API failed");
    } finally {
      isLoading.value = false;
    }
  }
  Future<void> deleteApartment(int apartmentId) async {
    try {
      bool success = await service.deleteApartment(apartmentId);

      if (success) {
        flat.removeWhere((item) => item.id == apartmentId);
        Get.snackbar("success".tr,  'success_delete_apartment'.tr);
      } else {
        Get.snackbar("Error".tr,  'error_delete_apartment'.tr);
      }
    } catch (e) {
      Get.snackbar("Error".tr,  'error_something_wrong'.tr);
    }
  }



}
