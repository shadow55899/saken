import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tapbar/ghazal/details.dart';

import '../controller/favorite_controller.dart';
import '../models/flat.dart';

class FavoriteScreen extends StatelessWidget {
  final FavoriteController controller = Get.find<FavoriteController>();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(title: Text('favorites'.tr), centerTitle: true),

      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Obx(() {
          final favorites = controller.favoriteList;

          if (favorites.isEmpty) {
            return Center(
              child: Text(
                'no_favorites_yet'.tr,
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          return GridView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 400,
              childAspectRatio: 6 / 8,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              final Flat flat = favorites[index];

              return InkWell(
                onTap: () async {
                  Get.put(FavoriteController());
                  await Get.find<FavoriteController>().checkFavorite(flat.id!);
                  Get.to(() => Details(), arguments: flat);
                },

                child: Container(
                  decoration: BoxDecoration(
                    color: isDark ? null : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(blurRadius: 6, spreadRadius: 2),
                    ],
                    border: Border.all(
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
                              child: Icon(
                                Icons.favorite,
                                size: 50,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ),

                      // INFO
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

                                  Text('${'city_id'.tr} ${flat.city}'),
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
      ),
    );
  }
}
