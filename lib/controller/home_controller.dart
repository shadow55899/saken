
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
  final Map<String, int> citesId = {
    'Dhadeel': 1,
    "Al Yarmouk": 2,
    "Jrmana": 3,
    "Baramka": 4,
    "Mhajreen": 5,
    "Bagdad.S": 6,
    "Midan": 7,
    "Rokn Aldeen": 8,
    "Mazah": 9,
    "Ar Rastan": 10,
    "Tadmur": 11,
    "Al Qusayr": 12,
    "Tallbisah": 13,
    "Al Qaryatayn": 14,
    "Tallkalakh": 15,
    "Kafr Laha": 16,
    "As Sukhnah": 17,
    "Shin": 18,
    "Tall Dhahab": 19,
    "Mahin": 20,
    "Ma`arrat an Nu`man": 21,
    "Khan Shaykhun": 22,
    "Jisr ash Shughur": 23,
    "Saraqib": 24,
    "Ma`arratmisrin": 25,
    "Kafr Nubl": 26,
    "Salqin": 27,
    "Harim": 28,
    "Binnish": 29,
    "Sarmada": 30,
    'Masyaf': 31,
    'Al-Salamiyah': 32,
    'Mhardeh': 33,
    'Al-Suqaylabiyah': 34,
    'Azaz': 35,
    'Manbij': 36,
    'Al-Bab': 37,
    'Jarabulus': 38,
    'Izra': 39,
    'Nawa': 40,
    'Jasim': 41,
    'Al-Sanamayn': 42,
    'Khan Arnabah': 43,
    'Madīnat al-Baath': 44,
    'Jubbata al-Khashab': 45,
    'Al-Rafid': 46,
    'Jableh': 47,
    'Al-Haffah': 48,
    'Qardaha': 49,
    'Rabia': 50,
    'Baniyas': 51,
    'Safita': 52,
    'Al-Sheikh Badr': 53,
    'Dreikish': 54,
    'Al-Mayadin': 55,
    'Al-Bukamal': 56,
    'Al-Shaddadah': 57,
    'Al-Suwar': 58,
    'Shahba': 59,
    'Salkhad': 60,
    'Al-Qurayya': 61,
    'Al-Mazraa': 62,
    'Al-Thawrah': 63,
    'Al-Sabkha': 64,
    'Maadan': 65,
    'Al-Karamah': 66,
    'Qamishli': 67,
    'Ras al-Ayn': 68,
    'Al-Malikiyah': 69,
    'Shaddadi': 70,
  };


  RxList<Flat> flat = <Flat>[].obs;
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
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    AuthController authController = Get.find<AuthController>();
    try {
      isLoading.value = true;
      flat.assignAll(await service.fetchFlats("${authController.userToken}"));
      print(" Requests Loaded: ${flat.length}");
      print(" Requests Loaded: ${flat}");
    } catch (e) {
      print(e);
      flat.assignAll(mockFlats);

     // Get.snackbar("Offline Mode", "Using mock data because API failed");
    } finally {
      isLoading.value = false;
    }
    super.onReady();
  }



  void setCity(String city) => selectedCity.value = city;

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

    minController.dispose();
    maxController.dispose();
    super.onClose();
  }


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
            "${auth.userToken}",
          );
          Get.back();

          break;

        case "area":
          results = await service.filterByArea(
            minArea.value,
            maxArea.value,
            "${auth.userToken}",
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
          final cityName = selectedCity.value;
          final cityId = citesId[cityName];
          if (cityId == null) {
            Get.snackbar("Error".tr,  'error_invalid_city'.tr);
            return;
          }
          results = await service.filterByCity(cityId, "${auth.userToken}");
          break;
        case "governorate":
          final govName = selectedGovernorate.value;
          final govId = governorateIds[govName];

          if (govId == null) {
            Get.snackbar("Error".tr,  'error_invalid_city'.tr);
            return;
          }

          results = await service.filterByGovernorate(
            govId,
            "${auth.userToken}",
          );
          break;



        default:
          results = await service.fetchFlats("${auth.userToken}");
      }

      flat.assignAll(results);
    } catch (e) {
      flat.assignAll(mockFlats);

    } finally {
      isLoading.value = false;
    }
  }
}
