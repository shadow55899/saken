import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tapbar/screens/apartment_owner_home.dart';
import 'package:tapbar/widgets/app_drawer.dart';

import '../controller/auth_controller.dart';
import 'admin.dart';
import 'home_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.only(top: 30, right: 30),
              child: Text("SAKEN"),
            ),
          ],
        ),
      ),

      body: Get.find<AuthController>().currentUser.value?.role.name == "admin"
          ? Admin()
          : Get.find<AuthController>().currentUser.value?.role.name == "renter"
          ? HomeScreen()
          : ApartmentOwnerHome(),

    );
  }
}
