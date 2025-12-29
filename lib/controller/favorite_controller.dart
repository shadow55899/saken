import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tapbar/models/flat.dart';
import 'package:tapbar/providers/favorite_provider.dart';

class FavoriteController extends GetxController {
  RxList<Flat> favoriteList = <Flat>[].obs;
  FavoriteProvider provider = FavoriteProvider();
  var icon = Rx<IconData>(Icons.star_rate_outlined);

  void rateApp() {
    if (icon.value == Icons.star_rate_outlined) {
      icon.value = Icons.star;
    } else {
      icon.value = Icons.star_rate_outlined;
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> getAllFavorite() async {
    try {
      List<Flat> favoriteList = await provider.getAllFavorite();
      this.favoriteList.assignAll(favoriteList);
    } catch (e) {
      Get.snackbar("Error", "Something went wrong");
    }
  }

  Future<void> removeFavorite(int id) async {
    try {
      await provider.removeFavorite(id);
      getAllFavorite();
    } catch (e) {
      Get.snackbar("Error", "Something went wrong");
    }
  }

  Future<void> addFavorite(int id) async {
    try {
      await provider.addFavorite(id);
      getAllFavorite();
    } catch (e) {
      Get.snackbar("Error", "Something went wrong");
    }
  }
}
