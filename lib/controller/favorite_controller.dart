import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tapbar/models/flat.dart';
import 'package:tapbar/providers/favorite_provider.dart';

class FavoriteController extends GetxController {
  RxList<Flat> favoriteList = <Flat>[].obs;
  FavoriteProvider provider = FavoriteProvider();
  var icon = Rx<IconData>(Icons.favorite_border_rounded);

  void rateApp() {
    if (icon.value == Icons.favorite_border_rounded) {
      icon.value = Icons.favorite_rounded;
    } else {
      icon.value = Icons.favorite_border_rounded;
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
      Get.snackbar("Error".tr,    'error_something_wrong'.tr);
    }
  }

  Future<void> addFavorite(int id) async {
    try {
      await provider.addFavorite(id);
      getAllFavorite();
    } catch (e) {
      Get.snackbar("Error".tr,    'error_something_wrong'.tr);
    }
  }
}
