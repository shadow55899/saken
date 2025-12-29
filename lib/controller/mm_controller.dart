// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';

// class MmController extends GetxController {
//   final RxList<File> allImages = <File>[].obs;
//   final ImagePicker _picker = ImagePicker();
//   final cityController = TextEditingController();
//   final priceController = TextEditingController();
//   final areaController = TextEditingController();
//   final roomsController = TextEditingController();
//   final hallsController = TextEditingController();
//   final bathroomsController = TextEditingController();
//   final descriptionController = TextEditingController();


//   /// 🔹 اختيار الصور من الكاميرا أو المعرض بدون تكرار
//   Future<void> pickImage({required bool fromCamera}) async {
//     if (fromCamera) {
//       final XFile? photo = await _picker.pickImage(
//         source: ImageSource.camera,
//         imageQuality: 75,
//       );
//       if (photo != null) {
//         final newFile = File(photo.path);

//         // ✅ تحقق من عدم وجودها مسبقًا
//         if (!allImages.any((img) => img.path == newFile.path)) {
//           allImages.add(newFile);
//         }
//       }
//     } else {
//       final List<XFile> photos = await _picker.pickMultiImage(
//         imageQuality: 75,
//       );
//       if (photos.isNotEmpty) {
//         for (var xfile in photos) {
//           final newFile = File(xfile.path);

//           // ✅ تحقق من التكرار قبل الإضافة
//           if (!allImages.any((img) => img.path == newFile.path)) {
//             allImages.add(newFile);
//           }
//         }
//       }
//     }

//     if (allImages.isEmpty) {
//       Get.snackbar("Image", "No image selected");
//     }
//   }

//   /// 🔹 زر الإرسال
//   void sendImages() {
//     if (allImages.isNotEmpty) {
//       Get.snackbar("Success", "You selected ${allImages.length} unique images!");
//     } else {
//       Get.snackbar("Error", "Please select at least one image");
//     }
//   }
// }
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../models/flat.dart';


class MmController extends GetxController {
  // ✅ TextEditingController لكل حقل
  final areaController = TextEditingController();
  final roomsController = TextEditingController();
  final livingRoomsController = TextEditingController();
  final bathroomsController = TextEditingController();
  final rentalPriceController = TextEditingController();
  final governorateController = TextEditingController();
  final cityController = TextEditingController();
  final addressController = TextEditingController();
  final statusController = TextEditingController();
  final descriptionController = TextEditingController();

  // ✅ الصور
  final RxList<File> allImages = <File>[].obs;
  final ImagePicker _picker = ImagePicker();

  /// اختيار الصور من الكاميرا أو المعرض بدون تكرار
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
      Get.snackbar("Image", "No image selected");
    }
  }

  /// إرسال البيانات (Add / Update)
  void sendData({required bool isUpdate, Flat? flat}) {
    // ✅ التحقق من الحقول المطلوبة
    if (areaController.text.isEmpty ||
        roomsController.text.isEmpty ||
        livingRoomsController.text.isEmpty ||
        bathroomsController.text.isEmpty ||
        rentalPriceController.text.isEmpty) {
      Get.snackbar("Error", "Please fill all required fields");
      return;
    }

    // ✅ جمع البيانات
    final newFlat = Flat(
      id : 1,
      area: int.parse(areaController.text),
      rooms: int.parse(roomsController.text),
      livingRooms: int.parse(livingRoomsController.text),
      bathrooms: int.parse(bathroomsController.text),
      rentalPrice: int.parse(rentalPriceController.text),
      governorate: governorateController.text,
      city: cityController.text,
      address: addressController.text,
      status: statusController.text,
      averageRate: flat?.averageRate,
      owner: flat?.owner,
      description: descriptionController.text,
      pictures: allImages.map((f) => f.path).toList(),
    );

    if (isUpdate) {
      updateFlat(newFlat, flat!.rentalPrice!); // مثال: استخدم ID أو قيمة مميزة
    } else {
      addFlat(newFlat);
    }
  }

  /// دوال API (مكانك تعديلها حسب الـ Backend)
  void addFlat(Flat flat) {
    // هنا ترسل POST للـ API
    Get.snackbar("Success", "Apartment added successfully!");
  }

  void updateFlat(Flat flat, int id) {
    // هنا ترسل PUT/PATCH للـ API
    Get.snackbar("Success", "Apartment updated successfully!");
  }

  @override
  void onClose() {
    // تحرير الموارد
    areaController.dispose();
    roomsController.dispose();
    livingRoomsController.dispose();
    bathroomsController.dispose();
    rentalPriceController.dispose();
    governorateController.dispose();
    cityController.dispose();
    addressController.dispose();
    statusController.dispose();
    descriptionController.dispose();
    super.onClose();
  }
}