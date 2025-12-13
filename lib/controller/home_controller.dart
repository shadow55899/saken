import 'package:apartment/controller/auth_controller.dart';
import 'package:apartment/models/flat.dart';
import 'package:apartment/service/home_service.dart';
import 'package:get/get.dart';

import '../providers/user_provider.dart';
import '../service/api_service.dart';

class HomeController extends GetxController {
  List<Flat> flat = [];
  final ApiService apiservice = new ApiService();
  HomeService service = HomeService();
  RxBool isLoading = true.obs;

  // Mock fallback list
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
      averageRate: "2.12",
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
      flat = await service.fetchFlats("${authController.userToken}");
      print(" Requests Loaded: ${flat.length}");
      print(" Requests Loaded: ${flat}");
    } catch (e) {
      print(e);
      flat = mockFlats;

      Get.snackbar("Offline Mode", "Using mock data because API failed");
    } finally {
      isLoading.value = false;
    }
    super.onReady();
  }
}
