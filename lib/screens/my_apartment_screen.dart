import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tapbar/controller/my_apartment_controller.dart';

import '../models/flat.dart';
import 'add_apartment.dart';

class MyApartmentScreen extends StatelessWidget {
  final MyApartmentController controller = Get.put(MyApartmentController());

  @override
  Widget build(BuildContext context) {
    final List<Flat> flats = controller.flat;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text('my_apartments'.tr),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return GridView.builder(
          //shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 400,
            childAspectRatio: 6 / 8,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),

          itemCount: flats.length,
          itemBuilder: (context, index) {
            final flat = flats[index];

            return InkWell(
              onTap: () {
                //Get.to(() => Details(), arguments: flat);
              },

              child: Container(
                decoration: BoxDecoration(
                  color: isDark ? null : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [BoxShadow(blurRadius: 6, spreadRadius: 2)],
                  border: BoxBorder.all(
                    color: isDark ? Colors.white : Colors.black,
                    width: 2,
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              child: const Center(
                                child: Icon(Icons.home, size: 50),
                              ),
                            ),

                            PopupMenuButton<String>(
                              icon: const Icon(Icons.more_vert),
                              onSelected: (value) {
                                if (value == 'update') {
                                  Get.to(
                                    () => AddApartment(
                                      isUpdate: true,
                                      flat: flat, // الكائن الخاص بالشقة
                                    ),
                                  );
                                } else if (value == 'delete') {
                                  Get.defaultDialog(
                                    title: 'delete_apartment'.tr,
                                    middleText: 'confirm_delete_apartment'.tr,
                                    textConfirm: 'delete'.tr ,
                                    textCancel:  'cancel'.tr,
                                    confirmTextColor: Colors.white,
                                    onConfirm: () {
                                      print(flat.id);
                                      controller.deleteApartment(flat.id!);
                                      Get.back();
                                    },
                                  );
                                  // كود الحذف هنا
                                }
                              },
                              itemBuilder: (context) =>  [
                                PopupMenuItem(
                                  value: 'update',
                                  child: Text('update_apartment'.tr ),
                                ),
                                PopupMenuItem(
                                  value: 'delete',
                                  child: Text( 'delete'.tr),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${flat.rentalPrice}\$',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '${flat.status}\$',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(Icons.location_on_outlined),
                                const SizedBox(width: 5),

                                Text('${'city'.tr} ${flat.city}')

                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Icons.straighten),
                                const SizedBox(width: 5),
                                //      Text('700'),
                                Text('${flat.area} m²'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
