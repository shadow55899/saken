import 'package:apartment/models/flat.dart';
import 'package:apartment/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final List<Flat> flats = [
    Flat(
      address: "275 O'Reilly Corners Apt. 570, Mireillehaven, MN",
      area: 120.0,
      averageRate: 4.5,
      bathrooms: 2,
      description: "Nice flat in Damascus",
      livingRooms: 1,
      rentalPrice: 2500.0,
      rooms: 3,
      status: "Booked",
      governorate: "Damascus",
      city: "An Nabk",
      owner: "Tamia Kuvalis",
      pictures: [],
    ),
    Flat(
      address: "316 Schmidt Gateway, New Jaquantown, ME",
      area: 90.0,
      averageRate: 4.0,
      bathrooms: 1,
      description: "Cozy flat in Aleppo",
      livingRooms: 1,
      rentalPrice: 1800.0,
      rooms: 2,
      status: "Free",
      governorate: "Aleppo",
      city: "Azaz",
      owner: "Jakob Barton",
      pictures: [],
    ),
    Flat(
      address: "123 Kertzmann Cliff Suite 004, Lucioustown, NH",
      area: 150.0,
      averageRate: 4.8,
      bathrooms: 3,
      description: "Spacious flat in Homs",
      livingRooms: 2,
      rentalPrice: 3000.0,
      rooms: 4,
      status: "Booked",
      governorate: "Homs",
      city: "Shin",
      owner: "Jakob Barton",
      pictures: [],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
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
                  SizedBox(width: 10),
                  Container(
                    width: 85,
                    height: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Price"),
                    ),
                  ),
                  Spacer(),
                  Text('Filters', style: TextStyle(fontSize: 25)),
                  SizedBox(width: 20),
                ],
              ),
            ),
            SizedBox(height: 10),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 6 / 8,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: flats.length,
              itemBuilder: (context, index) {
                final flat = flats[index];
                return InkWell(
                  onTap: () {
                    Get.to(() => DetailsScreen(), arguments: flat);
                  },

                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? null
                          : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: BoxBorder.all(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
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
                                    Text("City : ${flat.governorate}"),
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
