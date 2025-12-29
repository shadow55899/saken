
//
// import 'package:get/get.dart';
// import 'package:tapbar/controller/auth_controller.dart';
// import 'package:tapbar/models/flat.dart';
// import 'package:tapbar/service/home_service.dart';
// import '../service/api_service.dart';
//
// class HomeController extends GetxController {
//   RxList<Flat> flat =<Flat> [].obs;
//   final ApiService apiservice = new ApiService();
//   HomeService service = HomeService();
//   RxBool isLoading = true.obs;
//
//
//   final List<Flat> mockFlats = [
//     Flat(
//       area: 156,
//       rooms: 1,
//       livingRooms: 1,
//       bathrooms: 2,
//       rentalPrice: 111111,
//       governorate: "Homs",
//       city: "Al-Mokhaiam",
//       address:
//           "61458 Brock Springs Suite 398\nEast Margaritaton, CT 82919-6306",
//       status: "Booked",
//       averageRate: "2.12",
//       owner: "Evert O'Conner",
//       description: "Rerum sed quidem et recusandae soluta est sit.",
//       pictures: [],
//     ),
//   ];
//   @override
//   void onInit() {
//     super.onInit();
//   }
//
//   @override
//   void onReady() async {
//     AuthController authController = Get.find<AuthController>();
//     try {
//       isLoading.value = true;
//       flat.assignAll(await service.fetchFlats("${authController.userToken}"));
//       print(" Requests Loaded: ${flat.length}");
//       print(" Requests Loaded: ${flat}");
//     } catch (e) {
//       print(e);
//       flat.assignAll( mockFlats);
//
//       Get.snackbar("Offline Mode", "Using mock data because API failed");
//     } finally {
//       isLoading.value = false;
//     }
//     super.onReady();
//   }
// }
import 'package:get/get.dart';

//import '../service/api_service.dart';
import 'package:flutter/material.dart';

import '../models/flat.dart';
import '../providers/user_provider.dart';
import '../service/api_service.dart';
import '../service/home_service.dart';
import 'auth_controller.dart';

class HomeController extends GetxController {
  String activeFilter = '';
  // 🔹 Map governorate name → ID
  final Map<String, int> governorateIds = {
    'Damascus': 1,
    'Homs': 2,
    'Idlib': 3,
    'Hama': 4,
    'Aleppo': 5,
    'Daraa': 6,
    'Qwnitra': 7,
    'Latakia': 8,
    'Tartous': 9,
    'Dear Al-Zoor': 10,
    'Al-Swida': 11,
    'Al-Raqa': 12,
    'Al-Hasaka': 13,
  };


  RxList<Flat> flat =<Flat> [].obs;
  final ApiService apiservice = new ApiService();
  HomeService service = HomeService();
  RxBool isLoading = true.obs;



  RxString selectedCity = ''.obs;
  RxString selectedGovernorate = ''.obs;

  RxDouble minPrice = 300.0.obs;
  RxDouble maxPrice = 500.0.obs;

  RxDouble minArea = 1.2.obs;
  RxDouble maxArea = 1.8.obs;

  RxDouble numRooms = 1.0.obs;


  final TextEditingController minController = TextEditingController();
  final TextEditingController maxController = TextEditingController();



  final List<Flat> mockFlats = [
    Flat(
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
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    AuthController authController = Get.find<AuthController>();
    try {
      isLoading.value = true;
      flat.assignAll(await service.fetchFlats("${authController.userToken}"));
      //print(" Requests Loaded: ${flat.length}");
     // print(" Requests Loaded: ${flat}");
    } catch (e) {
      print(e);
      flat.assignAll( mockFlats);

      Get.snackbar("Offline Mode", "Using mock data because API failed");
    } finally {
      isLoading.value = false;
    }
    super.onReady();
  }

  // ===== Controllers للنصوص (لـ RangeCard) =====


  // ===== دوال لتعديل الـ State =====
  void setCity(String city) => selectedCity.value = city ;
  void setGovernorate(String gov) => selectedGovernorate.value = gov;

  void setPriceRange(double min, double max) {
    minPrice.value = min;
    maxPrice.value = max;
  }

  void setAreaRange(double min, double max) {
    minArea.value = min;
    maxArea.value = max;
  }

  void setRoomsRange(double num) {
    numRooms.value = num;

  }

  @override
  void onClose() {
    // تنظيف TextEditingControllers عند اغلاق Controller
    minController.dispose();
    maxController.dispose();
    super.onClose();
  }


//////////
  Future<void> applyFilters() async {
    try {
      isLoading.value = true;
      AuthController auth = Get.find<AuthController>();

      List<Flat> results = [];

      switch (activeFilter) {
        case "price":
          results = await service.filterByPrice(
              minPrice.value,
              maxPrice.value,
              "${auth.userToken}"
          );
          Get.back();

          break;

        case "area":
          results = await service.filterByArea(
              minArea.value,
              maxArea.value,
              "${auth.userToken}"

          );
          Get.back();

          break;

        case "rooms":
          results = await service.filterByRooms(
            numRooms.value.toInt(),
            "${auth.userToken}",
          );
          Get.back();

          break;

        case "city":
          results = await service.filterByCity(
            int.parse(selectedCity.value),
            "${auth.userToken}"  ,
          );
          Get.back();

          break;

        case "governorate":
          final govName = selectedGovernorate.value;
          final govId = governorateIds[govName];

          if (govId == null) {
            Get.snackbar("Error", "Invalid governorate selected");
            return;
          }

          results = await service.filterByGovernorate(
            govId,
            "${auth.userToken}",
          );
          break;

          Get.back();

          break;

        default:
          results = await service.fetchFlats("${auth.userToken}");
      }

      flat.assignAll(results);
    } catch (e) {
      flat.assignAll(mockFlats);
      Get.snackbar("Offline Mode", "Using mock data");
    } finally {
      isLoading.value = false;
    }
  }

}
