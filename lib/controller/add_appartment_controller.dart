
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../models/flat.dart';
import '../service/add_apartment_service.dart';

class AddAppartmentController extends GetxController {

  String? selectedGovernorate;
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

  String? selectedCity;
  final areaController = TextEditingController();
  final roomsController = TextEditingController();
  final livingRoomsController = TextEditingController();
  final bathroomsController = TextEditingController();
  final rentalPriceController = TextEditingController();
  final addressController = TextEditingController();
  final descriptionController = TextEditingController();

  final RxList<File> allImages = <File>[].obs;
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage({required bool fromCamera}) async {
    if (fromCamera) {
      final XFile? photo = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 75,
      );
      if (photo != null) {
        final newFile = File(photo.path);
        if (!allImages.any((img) => img.path == newFile.path)) {
          allImages.add(newFile);
        }
      }
    } else {
      final List<XFile> photos = await _picker.pickMultiImage(imageQuality: 75);
      if (photos.isNotEmpty) {
        for (var xfile in photos) {
          final newFile = File(xfile.path);
          if (!allImages.any((img) => img.path == newFile.path)) {
            allImages.add(newFile);
          }
        }
      }
    }

    if (allImages.isEmpty) {
      Get.snackbar("image".tr,  'image_no_selected'.tr);
    }
  }


  @override
  void onClose() {
    areaController.dispose();
    roomsController.dispose();
    livingRoomsController.dispose();
    bathroomsController.dispose();
    rentalPriceController.dispose();

    addressController.dispose();
    descriptionController.dispose();
    super.onClose();
  }

  void sendData({required bool isUpdate, Flat? flat}) async {
    if (areaController.text.isEmpty ||
        roomsController.text.isEmpty ||
        rentalPriceController.text.isEmpty) {
      Get.snackbar("Error".tr,   'error_fill_fields'.tr);
      return;
    }

    final cityName = selectedCity;
    final cityId = citesId[cityName];
    if (cityId == null) {
      Get.snackbar("Error".tr,   'error_select_city'.tr);
      return;
    }

    final flatData = Flat(
      area: int.parse(areaController.text),
      description: descriptionController.text,
      rooms: int.parse(roomsController.text),
      livingRooms: int.parse(livingRoomsController.text),
      bathrooms: int.parse(bathroomsController.text),
      rentalPrice: int.parse(rentalPriceController.text),
      governorate: selectedGovernorate,
      address: addressController.text,
    );

    final success = isUpdate
        ? await AddApartmentService().updateApartment(
      apartmentId: flat!.id!,
      flat: flatData,
      city: cityId,
      img: allImages.isNotEmpty ? allImages : null,
    )
        : await AddApartmentService().addApartment(
      flat: flatData,
      city: cityId,
      images: allImages,
    );


    if (success) {
      Get.snackbar("success".tr, 'success_add_apartment'.tr);

    } else {
      Get.snackbar("Error".tr,  'error_add_apartment'.tr);
    }
  }
}
