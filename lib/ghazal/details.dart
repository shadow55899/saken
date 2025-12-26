import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tapbar/controller/rate_controller.dart';
import 'package:tapbar/widgets/rate.dart';

import '../models/flat.dart';
// import 'package:rate_my_app/rate_my_app.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final Flat? flat = Get.arguments as Flat?;
    final RateController controller = Get.put(RateController());
    final screenHeight = MediaQuery.of(context).size.height;
    // final screenWidth = MediaQuery.of(context).size.width;

    if (flat == null) {
      return const Scaffold(body: Center(child: Text("No flat data provided")));
    }

    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Flat Details"))),
      floatingActionButton: Obx(
        () => FloatingActionButton(
          child: Icon(controller.icon.value),
          backgroundColor: isDark ? null : Colors.green[900],
          foregroundColor: isDark ? null : Colors.white,
          onPressed: () {
            controller.rateApp();
          },
        ),
      ),
      body: ListView(
        children: [
          // 🔹 Image placeholder
          // SizedBox(
          //   height: screenHeight * .30,
          //   child: Image.asset(
          //     "assets/FB_IMG_1637926450458.jpg",
          //     width: screenWidth,
          //     fit: BoxFit.cover,
          //   ),
          // ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Text(
              'Specifications',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),

          // 🔹 Show Flat description
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.all(12),
            height: screenHeight * .15,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Text(flat.description ?? "No description"),
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
                  title: "City ",
                  value: flat.city.toString(),
                ),
                const Divider(),
                _SpecRow(
                  icon: Icons.location_on_outlined,
                  title: "Governorate ",
                  value: flat.governorate.toString(),
                ),
                const Divider(),
                _SpecRow(
                  icon: Icons.price_change_outlined,
                  title: "Price",
                  value: "${flat.rentalPrice}\$",
                ),
                const Divider(),
                _SpecRow(
                  icon: Icons.straighten,
                  title: "Area",
                  value: "${flat.area} m²",
                ),
                const Divider(),
                _SpecRow(
                  icon: Icons.bedroom_parent,
                  title: "Rooms",
                  value: flat.rooms.toString(),
                ),
                const Divider(),
                _SpecRow(
                  icon: Icons.living_rounded,
                  title: "Halls",
                  value: flat.livingRooms.toString(),
                ),
                const Divider(),
                _SpecRow(
                  icon: Icons.bathroom,
                  title: "Bathrooms",
                  value: flat.bathrooms.toString(),
                ),
                const Divider(),
                _SpecRow(
                  icon: Icons.history,
                  title: "Status",
                  value: flat.status.toString(),
                ),
                const Divider(),
                _SpecRow(
                  icon: Icons.domain,
                  title: "Average Rate",
                  value: flat.averageRate.toString(),
                ),
              ],
            ),
          ),

          const Center(
            child: Text(
              'If you want to book this flat',
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
                // booking action
              },
              child: const Center(child: Text('Reserve Now')),
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
