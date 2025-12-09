import 'package:apartment/controller/rate_controller,dart';
import 'package:apartment/models/flat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:rate_my_app/rate_my_app.dart';

                                          
class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve the Flat object passed from previous screen
    // late RateMyApp rateMyApp = RateMyApp(
    //   googlePlayIdentifier: 'app.openauthenticator',
    //   appStoreIdentifier: '6479272927',
    // );
    final Flat? flat = Get.arguments as Flat?;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    if (flat == null) {
      return const Scaffold(body: Center(child: Text("No flat data provided")));
    }

    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Flat Details"))),
      // floatingActionButton: FloatingActionButton(
      //   child: const Icon(Icons.star_rate),
      //   onPressed: () {
      //     showDialog(
      //       context: context,
      //       builder: (_) => AlertDialog(
      //         title: const Text('Rate our app'),
      //         content: const Text(
      //           'If you enjoy using this app, please take a moment to rate it.',
      //         ),
      //         actions: [
      //           TextButton(
      //             onPressed: () => Navigator.pop(context),
      //             child: const Text('Later'),
      //           ),
      //           TextButton(
      //             onPressed: () {
      //               rateMyApp.launchStore(); // opens Play Store / App Store
      //               Navigator.pop(context);
      //             },
      //             child: const Text('Rate Now'),
      //           ),
      //         ],
      //       ),
      //     );
      //   },
      // ),
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
                  title: "City ID",
                  value: flat.city_id.toString(),
                ),
                const Divider(),
                _SpecRow(
                  icon: Icons.price_change_outlined,
                  title: "Price",
                  value: "${flat.rental_price}\$",
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
                  value: flat.living_rooms.toString(),
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
                  value: flat.average_rate.toString(),
                ),
              ],
            ),
          ),

          const Center(
            child: Text(
              'اذا كنت ترغب بالحجز',
              style: TextStyle(fontWeight: FontWeight.w100),
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
              child: const Center(child: Text('حجز')),
            ),
          ),
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
