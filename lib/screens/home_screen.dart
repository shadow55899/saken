import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:tapbar/widgets/room_apply.dart';
import '../Locations.dart';
import '../controller/home_controller.dart';
import '../ghazal/details.dart';
import '../models/flat.dart';
import '../widgets/Range_Card.dart';
import '../widgets/close_button_responsive.dart';
import '../widgets/filter_card.dart';
import '../widgets/filter_option_tile.dart';
import '../widgets/select_gride.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final List<Flat> flats = controller.flat;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            // Container(
            //   height: 60,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(45),
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.end,
            //     children: [
            //       Container(
            //         width: 75,
            //         height: double.infinity,
            //         child: ElevatedButton(
            //           onPressed: () {},
            //           child: Text("City"),
            //         ),
            //       ),
            //       SizedBox(width: 10),
            //       Container(
            //         width: 80,
            //         height: double.infinity,
            //         child: ElevatedButton(
            //           onPressed: () {},
            //           child: Text("Price"),
            //         ),
            //       ),
            //       Spacer(),
            //       Text('Filtter', style: TextStyle(fontSize: 25)),
            //       SizedBox(width: 20),
            //     ],
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  // ===== FilterCard الرئيسي =====
                  FilterCard(
                    title: "Filter",
                    icon: Icons.filter_list,
                    color: Colors.teal,
                    onTap: () => _openFilterOptions(),
                    subtitle: '',
                  ),
                  const SizedBox(height: 20),
                  FilterCard(
                    title: "Remove Filter",
                    icon: Icons.remove_circle,
                    color: Colors.teal,
                    onTap: () => controller.onReady(),
                    subtitle: '',
                  ),
                  const SizedBox(height: 20),

                  // ===== عرض القيم المختارة بشكل حي =====
                  Obx(
                    () => Text(
                      "Governorate: ${controller.selectedGovernorate.value}\n"
                      "City: ${controller.selectedCity.value}\n"
                      "Price: ${controller.minPrice.value}-${controller.maxPrice.value}\n"
                      "Area: ${controller.minArea.value}-${controller.maxArea.value}\n"
                      "Rooms: ${controller.numRooms.value}",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 10),

            Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
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
                      Get.to(() => Details(), arguments: flat);
                    },

                    child: Container(
                      decoration: BoxDecoration(
                        color: isDark ? null : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(blurRadius: 6, spreadRadius: 2),
                        ],
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
                              child: Container(
                                child: const Center(
                                  child: Icon(Icons.home, size: 50),
                                ),
                              ),
                            ),
                          ),

                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${flat.rentalPrice}\$',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(Icons.location_on_outlined),
                                      const SizedBox(width: 5),
                                      Text("City ID: ${flat.city}"),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(Icons.straighten),
                                      const SizedBox(width: 5),
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
          ],
        ),
      ),
    );
  }

  // ==================== BottomSheet الفلاتر ====================
  void _openFilterOptions() {
    Get.bottomSheet(
      SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          height: Get.height * 0.75,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Center(
                child: Text(
                  "Choose Filter Type",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
              ),
              const SizedBox(height: 25),

              Expanded(
                child: ListView(
                  children: [
                    FilterOptionTile(
                      label: "City",
                      icon: Icons.location_city,
                      onTap: () => _openSubFilterSheet("City"),
                    ),
                    const Divider(),
                    FilterOptionTile(
                      label: "Price",
                      icon: Icons.price_change,
                      onTap: () => _openSubFilterSheet("Price"),
                    ),
                    const Divider(),
                    FilterOptionTile(
                      label: "Governorate",
                      icon: Icons.map,
                      onTap: () => _openSubFilterSheet("Governorate"),
                    ),
                    const Divider(),
                    FilterOptionTile(
                      label: "Area",
                      icon: Icons.square_foot,

                      onTap: () => _openSubFilterSheet("Area"),
                    ),
                    const Divider(),
                    FilterOptionTile(
                      label: "Rooms",
                      icon: Icons.meeting_room,
                      onTap: () => _openSubFilterSheet("Rooms"),
                    ),
                  ],
                ),
              ),

              CloseButtonResponsive(
                label: "Close",
                onPressed: () => Get.back(),
              ),
            ],
          ),
        ),
      ),
      isScrollControlled: true,
    );
  }

  void _openSubFilterSheet(String filterType) {
    Get.bottomSheet(
      SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          height: Get.height * 0.65,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
          ),
          child: _buildFilterContent(filterType, controller),
        ),
      ),
      isScrollControlled: true,
    );
  }
}

Widget _buildFilterContent(String type, HomeController controller) {
  // ===== هنا تم تعديل المنطق: القيم المختارة تمر مباشرة للـController =====
  if (type == "Governorate") {
    return SelectGrid(
      title: "Governorate",
      options: Locations.governorates,
      selectedValue: controller.selectedGovernorate,
      onChanged: (value) async {
        controller.setGovernorate(value);
        controller.activeFilter = "governorate";
        await controller.applyFilters();
        Get.back(); // close bottom sheet
        Get.back(); // close bottom sheet
      },
    );
  } else if (type == "City") {
    return SelectGrid(
      title: "City",
      options: Locations.cites, // أو إذا كان لديك قائمة المدن
      selectedValue: controller.selectedCity,

      onChanged: (value) async {
        controller.setCity(value);
        controller.activeFilter = "city";
        await controller.applyFilters();
        Get.back();
        Get.back(); // close bottom sheet
      },
    );
  } else if (type == "Price") {
    return RangeCard(
      title: "Price",
      minLabel: "Min Price (\$)",
      maxLabel: "Max Price (\$)",
      minValue: controller.minPrice,
      maxValue: controller.maxPrice,
      onApply: () async {
        controller.activeFilter = "price";
        controller.setPriceRange(
          controller.minPrice.value,
          controller.maxPrice.value,
        );
        await controller.applyFilters();
        Get.back();
      },
    );
  } else if (type == "Area") {
    return RangeCard(
      title: "Area",
      minLabel: "Min Area (m²)",
      maxLabel: "Max Area (m²)",
      minValue: controller.minArea,
      maxValue: controller.maxArea,
      onApply: () async {
        controller.activeFilter = "area";
        controller.setAreaRange(
          controller.minArea.value,
          controller.maxArea.value,
        );
        await controller.applyFilters();
        Get.back();
      },
    );
  } else if (type == "Rooms") {
    return RoomApply(
      title: "Rooms",
      Label: " Rooms",
      Value: controller.numRooms,
      onApply: () async {
        controller.activeFilter = "rooms";
        controller.setRoomsRange(controller.numRooms.value);
        await controller.applyFilters();
        Get.back();
      },
    );
  } else {
    return const Center(child: Text("Unknown filter type"));
  }
}
