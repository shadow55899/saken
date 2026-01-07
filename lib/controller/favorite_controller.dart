import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tapbar/models/flat.dart';
import 'package:tapbar/providers/favorite_provider.dart';

class FavoriteController extends GetxController {
  RxList<Flat> favoriteList = <Flat>[].obs;
  FavoriteProvider provider = FavoriteProvider();
  var icon = Rx<IconData>(Icons.favorite_border_rounded);
  RxBool isFavorite = false.obs;

  Future<void> checkFavorite(int id) async {
    try {
      await getAllFavorite();
      isFavorite.value = favoriteList.any((element) => element.id == id);
      icon.value = isFavorite.value
          ? Icons.favorite_rounded
          : Icons.favorite_border_rounded;
    } catch (e) {
      Get.snackbar("Error", "Something went wrong");
    }
  }

  void toggleFavorite(int id) async {
    // Check current state
    bool currentlyFavorite = favoriteList.any((f) => f.id == id);

    if (currentlyFavorite) {
      // Remove
      await removeFavorite(id);
      isFavorite.value = false;
      icon.value = Icons.favorite_border_rounded;
    } else {
      // Add
      await addFavorite(id);
      isFavorite.value = true;
      icon.value = Icons.favorite_rounded;
    }
  }

  @override
  void onInit() async {
    super.onInit();
    await getAllFavorite();
  }

  @override
  void onReady() {
    super.onReady();
    print(isFavorite.value);
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
      Get.snackbar("Error".tr, 'error_something_wrong'.tr);
    }
  }

  Future<void> addFavorite(int id) async {
    try {
      await provider.addFavorite(id);
      getAllFavorite();
    } catch (e) {
      Get.snackbar("Error".tr, 'error_something_wrong'.tr);
    }
  }
}
