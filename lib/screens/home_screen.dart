import 'package:apartment/controller/auth_controller.dart';
import 'package:apartment/controller/home_controller.dart';
import 'package:apartment/ghazal/details.dart';
import 'package:apartment/models/flat.dart';
import 'package:apartment/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final List<Flat> flats = controller.flat;
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            // 🔹 Filter Bar
            // 🔹 Filter Bar (no Padding widget used)
            Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 75,
                    height: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("City"),
                    ),
                  ),
                  SizedBox(width: 10), // spacing between buttons
                  Container(
                    width: 80,
                    height: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Price"),
                    ),
                  ),
                  Spacer(), // pushes "فلترة" text to the right
                  Text('فلترة', style: TextStyle(fontSize: 25)),
                  SizedBox(width: 20), // right spacing instead of Padding
                ],
              ),
            ),
            SizedBox(height: 10),
            // 🔹 Grid of Flats
            GridView.builder(
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
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(blurRadius: 6, spreadRadius: 2),
                      ],
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

                        // 🔹 Info
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
            ),
          ],
        ),
      ),
    );
  }
}
