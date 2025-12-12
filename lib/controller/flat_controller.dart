import 'package:apartment/models/flat.dart';
import 'package:apartment/providers/flat_provider.dart';
import 'package:get/get.dart';

class FlatsController extends GetxController {
  var flats = <Flat>[].obs;
  var displayFlats = <Flat>[].obs;
  FlatProvider provider = FlatProvider();

  @override
  void onInit() {
    super.onInit();
    flats.assignAll([
      Flat(
        address: "275 O'Reilly Corners Apt. 570, Mireillehaven, MN",
        area: 120.0,
        averageRate: 4.5,
        bathrooms: 2,
        description: "Nice flat in Damascus",
        livingRooms: 1,
        rentalPrice: 2500.0,
        rooms: 3,
        status: "Booked",
        governorate: "Damascus",
        city: "An Nabk",
        owner: "Tamia Kuvalis",
        pictures: [],
      ),
      Flat(
        address: "316 Schmidt Gateway, New Jaquantown, ME",
        area: 90.0,
        averageRate: 4.0,
        bathrooms: 1,
        description: "Cozy flat in Aleppo",
        livingRooms: 1,
        rentalPrice: 1800.0,
        rooms: 2,
        status: "Free",
        governorate: "Aleppo",
        city: "Azaz",
        owner: "Jakob Barton",
        pictures: [],
      ),
    ]);
    displayFlats.assignAll(flats);
  }

  void filterByCity(String city) {
    displayFlats.assignAll(flats.where((f) => f.city == city).toList());
  }

  void filterByPrice(double maxPrice) {
    displayFlats.assignAll(
      flats.where((f) => f.rentalPrice! <= maxPrice).toList(),
    );
  }

  void removeFlat(Flat flat) {
    flats.remove(flat);
    displayFlats.remove(flat);
  }

  Future<void> getAllApartments() async {
    try {
      await provider.getAllFlats();
      flats.assignAll(FlatProvider.flats);
    } catch (e) {
      Get.snackbar("Error", "Something went wrong");
    }
  }
}
