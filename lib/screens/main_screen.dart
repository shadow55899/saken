
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tapbar/widgets/themes.dart';

import '../controller/auth_controller.dart';
import '../controller/login_controller.dart';
import 'admin.dart';
import 'home_screen.dart';

class MainScreen extends StatelessWidget {
  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              loginController.logout();
            },
            icon: Icon(Icons.logout),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.only(top: 30, right: 30),
                child: Text("SAKEN"),
              ),
            ],
          ),

          bottom: TabBar(
            labelColor: Theme.of(context).brightness == Brightness.dark
                ? Colors.black
                : Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.home_sharp)),
              Tab(icon: Icon(Icons.notifications)),
              Tab(icon: Icon(Icons.person)),
            ],
          ),
        ),

        body: TabBarView(
          children: [
            Get.find<AuthController>().currentUser.value?.role.name == "admin"
                ? Admin()
                : HomeScreen(),
            Center(child: MaterialButton(onPressed: ()=>changeTheme(),
            child: Text('Theme'),
            )),
            Center(child: Text("Empty User Info")),
          ],
        ),
      ),
    );
  }
}
