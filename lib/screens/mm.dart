// import 'dart:io';
// import 'package:ff/mm_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:ff/spacrow.dart';

// class Mm extends StatelessWidget {


//   final MmController controller = Get.put(MmController());
//   final bool isUpdate;
//   final Apartment?

//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Center(child: Text("Add Apartment")),
//         backgroundColor: Colors.teal,
//         elevation: 2,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(12),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
//               child: Text(
//                 'Add apartment details',
//                 style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//               ),
//             ),

//             SizedBox(height: screenHeight * 0.01),

//             // ✅ القسم الأول: الصور والوصف
//             Card(
//               elevation: 3,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: Column(
//                   children: [
//                     // 🟢 أزرار اختيار الصور
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         ElevatedButton(
//                           onPressed: () =>
//                               controller.pickImage(fromCamera: false),
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.teal,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                           ),
//                           child: const Text("From Gallery"),
//                         ),
//                         ElevatedButton(
//                           onPressed: () =>
//                               controller.pickImage(fromCamera: true),
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.teal,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                           ),
//                           child: const Text("From Camera"),
//                         ),
//                       ],
//                     ),

//                     const SizedBox(height: 12),

//                     // 🖼️ عرض الصور مرة واحدة فقط في صف واحد مشترك
//                     Obx(() {
//                       final images = controller.allImages;
//                       return images.isEmpty
//                           ? const Text("No images selected")
//                           : SingleChildScrollView(
//                               scrollDirection: Axis.horizontal,
//                               child: Row(
//                                 children: images.map((file) {
//                                   return Padding(
//                                     padding: const EdgeInsets.only(right: 8),
//                                     child: Stack(
//                                       children: [
//                                         ClipRRect(
//                                           borderRadius:
//                                               BorderRadius.circular(12),
//                                           child: Image.file(
//                                             file,
//                                             width: 100,
//                                             height: 100,
//                                             fit: BoxFit.cover,
//                                           ),
//                                         ),
//                                         Positioned(
//                                           top: 4,
//                                           right: 4,
//                                           child: GestureDetector(
//                                             onTap: () =>
//                                                 controller.allImages.remove(file),
//                                             child: Container(
//                                               decoration: BoxDecoration(
//                                                 color: Colors.black54,
//                                                 shape: BoxShape.circle,
//                                               ),
//                                               padding:
//                                                   const EdgeInsets.all(3),
//                                               child: const Icon(
//                                                 Icons.close,
//                                                 size: 16,
//                                                 color: Colors.white,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   );
//                                 }).toList(),
//                               ),
//                             );
//                     }),

//                     const SizedBox(height: 16),

//                     // 📝 حقل الوصف
//                     Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         "Description",
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Colors.grey[700],
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 6),
//                     TextField(
//                       controller: controller.descriptionController,
//                       maxLines: 3,
//                       decoration: InputDecoration(
//                         hintText: "Write a short description...",
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         filled: true,
//                         fillColor: Colors.grey[100],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             SizedBox(height: screenHeight * 0.02),

//             // ✅ القسم الثاني: تفاصيل العقار
//             Card(
//               elevation: 3,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: Column(
//                   children: [
//                     SpecRow(
//                       icon: Icons.location_on_outlined,
//                       title: "City ID",
//                       val: TextField(
//                         decoration: InputDecoration(
//                           hintText: "Enter city ID or name",
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                       ),
//                     ),


//                     const Divider(),
//                     SpecRow(
//                       icon: Icons.price_change_outlined,
//                       title: "Price",
//                       val: TextField(
//                         decoration: InputDecoration(
//                           hintText: "Enter price (\$)",
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                         keyboardType: TextInputType.number,
//                       ),
//                     ),
//                     const Divider(),
//                     SpecRow(
//                       icon: Icons.straighten,
//                       title: "Area",
//                       val: TextField(
//                         decoration: InputDecoration(
//                           hintText: "Enter area (m²)",
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                         keyboardType: TextInputType.number,
//                       ),
//                     ),
//                     const Divider(),
//                     SpecRow(
//                       icon: Icons.bedroom_parent,
//                       title: "Rooms",
//                       val: TextField(
//                         decoration: InputDecoration(
//                           hintText: "Enter number of rooms",
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                         keyboardType: TextInputType.number,
//                       ),
//                     ),
//                     const Divider(),
//                     SpecRow(
//                       icon: Icons.living_rounded,
//                       title: "Halls",
//                       val: TextField(
//                         decoration: InputDecoration(
//                           hintText: "Enter number of halls",
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                         keyboardType: TextInputType.number,
//                       ),
//                     ),
//                     const Divider(),
//                     SpecRow(
//                       icon: Icons.bathroom,
//                       title: "Bathrooms",
//                       val: TextField(
//                         decoration: InputDecoration(
//                           hintText: "Enter number of bathrooms",
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                         keyboardType: TextInputType.number,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             SizedBox(height: screenHeight * 0.03),

//             // ✅ زر الإرسال
//             Center(
//               child: MaterialButton(
//                 height: 50,
//                 minWidth: screenWidth * 0.6,
//                 color: Colors.teal,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//                 onPressed: controller.sendImages,
//                 child: const Text(
//                   'Send',
//                   style: TextStyle(
//                     fontSize: 18,
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),

//             SizedBox(height: screenHeight * 0.03),
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/mm_controller.dart';
import '../models/flat.dart';


class Mm extends StatelessWidget {
  final bool isUpdate;
  final Flat? flat;

  Mm({super.key, required this.isUpdate, this.flat});

  final MmController controller = Get.put(MmController());

  @override
  Widget build(BuildContext context) {
    // ✅ إذا كانت تحديث، عبئ الحقول مسبقًا
    if (isUpdate && flat != null) {
      controller.areaController.text = flat!.area.toString();
      controller.roomsController.text = flat!.rooms.toString();
      controller.livingRoomsController.text = flat!.livingRooms.toString();
      controller.bathroomsController.text = flat!.bathrooms.toString();
      controller.rentalPriceController.text = flat!.rentalPrice.toString();
      controller.governorateController.text = flat!.governorate ?? '';
      controller.cityController.text = flat!.city ?? '';
      controller.addressController.text = flat!.address ?? '';
      controller.statusController.text = flat!.status ?? '';
      controller.descriptionController.text = flat!.description ?? '';
      controller.allImages.assignAll(
          flat!.pictures!.map((p) => File(p)).toList()); // تعديل حسب نوع الصور
    }

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(isUpdate ? "Update Apartment" : "Add Apartment"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isUpdate ? "Update apartment details" : "Add apartment details",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // ✅ الصور
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () =>
                              controller.pickImage(fromCamera: false),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          child: const Text("From Gallery"),
                        ),
                        ElevatedButton(
                          onPressed: () =>
                              controller.pickImage(fromCamera: true),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          child: const Text("From Camera"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Obx(() {
                      final images = controller.allImages;
                      return images.isEmpty
                          ? const Text("No images selected")
                          : SingleChildScrollView(
                              scrollDirection: Axis.horizontal,


                             child: Row(
                                children: images.map((file) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12),
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
                                            onTap: () =>
                                                controller.allImages.remove(file),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.black54,
                                                  shape: BoxShape.circle),
                                              padding: const EdgeInsets.all(3),
                                              child: const Icon(Icons.close,
                                                  size: 16, color: Colors.white),
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
            buildTextField("Area (m²)", controller.areaController,
                keyboardType: TextInputType.number),
            buildTextField("Rooms", controller.roomsController,
                keyboardType: TextInputType.number),
            buildTextField("Living Rooms", controller.livingRoomsController,
                keyboardType: TextInputType.number),
            buildTextField("Bathrooms", controller.bathroomsController,
                keyboardType: TextInputType.number),
            buildTextField("Rental Price", controller.rentalPriceController,
                keyboardType: TextInputType.number),
            buildTextField("Governorate", controller.governorateController),
            buildTextField("City", controller.cityController),
            buildTextField("Address", controller.addressController),
            buildTextField("Status", controller.statusController),
            buildTextField("Description", controller.descriptionController,
                maxLines: 3),

            const SizedBox(height: 32),

            Center(
              child: MaterialButton(
                height: 50,
                minWidth: screenWidth * 0.6,
                color: Colors.teal,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                onPressed: () =>
                    controller.sendData(isUpdate: isUpdate, flat: flat),
                child: Text(
                  isUpdate ? "Update" : "Send",


style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller,
      {int maxLines = 1, TextInputType keyboardType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          filled: true,
          fillColor: Colors.grey[100],
        ),
      ),
    );
  }
}