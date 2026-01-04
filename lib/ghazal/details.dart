import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tapbar/controller/favorite_controller.dart';
import 'package:tapbar/controller/rate_controller.dart';
import 'package:tapbar/widgets/rate.dart';

import '../controller/booking_controller.dart';
import '../models/flat.dart';
import '../widgets/booking_dialog.dart';
// import 'package:rate_my_app/rate_my_app.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final Flat? flat = Get.arguments as Flat?;
    final FavoriteController controller = Get.put(FavoriteController());
    final screenHeight = MediaQuery.of(context).size.height;
    // final screenWidth = MediaQuery.of(context).size.width;

    if (flat == null) {
      return const Scaffold(body: Center(child: Text("No flat data provided")));
    }

    return Scaffold(
      appBar: AppBar(title: Center(child: Text('flat_details'.tr))),
      floatingActionButton: Obx(
        () => FloatingActionButton(
          child: Icon(controller.icon.value),
          backgroundColor: isDark ? null : Colors.green[900],
          foregroundColor: isDark ? null : Colors.white,
          onPressed: () {
            //controller.rateApp(flat.id);
            controller.rateApp();
          },
        ),
      ),
      body: ListView(
        children: [

          Container(
            height: 250,
            color: Colors.grey[200],
            child: (flat.pictures == null || flat.pictures!.isEmpty)
                ? const Center(
              child: Text(
                "No images available",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
                : PageView.builder(
              itemCount: flat.pictures!.length,
              itemBuilder: (context, index) {
                final imageUrl = flat.pictures![index];

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, progress) {
                        if (progress == null) return child;
                        return const Center(
                            child: CircularProgressIndicator());
                      },
                      errorBuilder: (context, error, stackTrace) =>
                      const Center(
                          child: Icon(Icons.broken_image, size: 50)),
                    ),
                  ),
                );
              },
            ),
          ),

           Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Text(
              'specifications'.tr,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),

          // 🔹 Show Flat description
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.all(12),
            height: screenHeight * .15,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Text(flat.description ?? 'no_description'.tr),
          ),

          // 🔹 More Specifications using Flat fields
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                _SpecRow(
                  icon: Icons.location_on_outlined,
                  title: 'city'.tr,
                  value: flat.city.toString(),
                ),
                const Divider(),
                _SpecRow(
                  icon: Icons.location_on_outlined,
                  title: "governorate".tr,
                  value: flat.governorate.toString(),
                ),
                const Divider(),
                _SpecRow(
                  icon: Icons.price_change_outlined,
                  title: "price".tr,
                  value: "${flat.rentalPrice}\$",
                ),
                const Divider(),
                _SpecRow(
                  icon: Icons.straighten,
                  title: "area".tr,
                  value: "${flat.area} ${'m²'.tr}",
                ),
                const Divider(),
                _SpecRow(
                  icon: Icons.bedroom_parent,
                  title: "rooms".tr,
                  value: flat.rooms.toString(),
                ),
                const Divider(),
                _SpecRow(
                  icon: Icons.living_rounded,
                  title: "halls".tr,
                  value: flat.livingRooms.toString(),
                ),
                const Divider(),
                _SpecRow(
                  icon: Icons.bathroom,
                  title: "bathrooms".tr,
                  value: flat.bathrooms.toString(),
                ),
                const Divider(),
                _SpecRow(
                  icon: Icons.history,
                  title: "status".tr,
                  value: flat.status.toString(),
                ),
                const Divider(),
                _SpecRow(
                  icon: Icons.domain,
                  title: 'average_rate'.tr,

                  value: flat.averageRate.toString() == "0.0"
                      ? 'no_rate'.tr
                      : flat.averageRate.toString(),
                ),
              ],
            ),
          ),

           Center(
            child: Text(
              'if_you_want_to_book'.tr,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              onPressed: () {
                print("Booking button clicked!"); // Debug

                if (!Get.isRegistered<BookingController>()) {
                  Get.put(BookingController());
                }

                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  builder: (_) => BookingDialog(flatId: flat.id!),
                );
              },
              child:
              Center(child: Text('reserve_now'.tr)),
            ),
          ),
          Rate(),
        ],
      ),
    );
  }
}

// 🔹 Helper widget
class _SpecRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _SpecRow({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Row(
            children: [Icon(icon), const SizedBox(width: 10), Text(title)],
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}


