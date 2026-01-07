import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Locations.dart';
import '../controller/add_appartment_controller.dart';
import '../models/flat.dart';

class AddApartment extends StatelessWidget {
  final bool isUpdate;
  final Flat? flat;

  AddApartment({super.key, required this.isUpdate, this.flat});

  final AddAppartmentController controller = Get.put(AddAppartmentController());

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    if (isUpdate && flat != null && controller.selectedGovernorate == null) {
      controller.selectedGovernorate = flat!.governorate;
      controller.selectedCity = flat!.city;
    }

    // ✅ إذا كانت تحديث، عبئ الحقول مسبقًا
    if (isUpdate && flat != null && controller.areaController.text.isEmpty) {
      controller.areaController.text = flat!.area.toString();
      controller.roomsController.text = flat!.rooms.toString();
      controller.livingRoomsController.text = flat!.livingRooms.toString();
      controller.bathroomsController.text = flat!.bathrooms.toString();
      controller.rentalPriceController.text = flat!.rentalPrice.toString();
      controller.addressController.text = flat!.address ?? '';
      controller.descriptionController.text = flat!.description ?? '';
      // controller.allImages.assignAll(
      //   flat!.pictures!.map((p) => File(p)).toList(),
      // ); // تعديل حسب نوع الصور
    }

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(isUpdate ? 'update_apartment'.tr : 'add_apartment'.tr),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isUpdate ? 'update_details'.tr : 'add_details'.tr,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // ✅ الصور
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                right: 8.0,
                                left: 8,
                              ),
                              child: ElevatedButton(
                                onPressed: () =>
                                    controller.pickImage(fromCamera: false),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.teal,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Text('from_gallery'.tr),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: ElevatedButton(
                                onPressed: () =>
                                    controller.pickImage(fromCamera: true),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.teal,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Text('from_camera'.tr),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 12),
                    Obx(() {
                      final images = controller.allImages;

                      // If updating and no new images selected, show nothing
                      if (isUpdate && images.isEmpty) {
                        return SizedBox.shrink();
                      }

                      return images.isEmpty
                          ? Text('no_images'.tr)
                          : SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: images.map((file) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                          child: Image.file(
                                            file,
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Positioned(
                                          top: 4,
                                          right: 4,
                                          child: GestureDetector(
                                            onTap: () => controller.allImages
                                                .remove(file),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.black54,
                                                shape: BoxShape.circle,
                                              ),
                                              padding: const EdgeInsets.all(3),
                                              child: const Icon(
                                                Icons.close,
                                                size: 16,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            );
                    }),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // ✅ حقول Flat
            buildTextField(
              isDark,
              'area'.tr,
              controller.areaController,
              keyboardType: TextInputType.number,
            ),
            buildTextField(
              isDark,
              'rooms'.tr,
              controller.roomsController,
              keyboardType: TextInputType.number,
            ),
            buildTextField(
              isDark,
              'halls'.tr,
              controller.livingRoomsController,
              keyboardType: TextInputType.number,
            ),
            buildTextField(
              isDark,
              'bathrooms'.tr,
              controller.bathroomsController,
              keyboardType: TextInputType.number,
            ),
            buildTextField(
              isDark,
              'rental_price'.tr,
              controller.rentalPriceController,
              keyboardType: TextInputType.number,
            ),

            DropdownButtonFormField<String>(
              value: Locations.cites.contains(controller.selectedCity)
                  ? controller.selectedCity
                  : null,

              decoration: InputDecoration(
                labelText: 'city'.tr,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              items: Locations.cites
                  .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                  .toList(),
              onChanged: (value) {
                controller.selectedCity = value;
              },
            ),

            buildTextField(isDark, 'address'.tr, controller.addressController),
            buildTextField(
              isDark,
              'description'.tr,
              controller.descriptionController,
              maxLines: 3,
            ),

            const SizedBox(height: 32),

            Center(
              child: MaterialButton(
                height: 50,
                minWidth: screenWidth * 0.6,
                color: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                onPressed: () =>
                    controller.sendData(isUpdate: isUpdate, flat: flat),
                child: Text(
                  isUpdate ? 'update'.tr : 'send'.tr,

                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(
    bool isDark,
    String label,
    TextEditingController controller, {
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        style: TextStyle(color: isDark ? Colors.black : null),
        controller: controller,
        maxLines: maxLines,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          filled: true,
          fillColor: isDark ? null : Colors.grey[100],
        ),
      ),
    );
  }
}
