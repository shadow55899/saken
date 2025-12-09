import 'package:apartment/controller/register_controller.dart';
import 'package:apartment/providers/user_provider.dart';
import 'package:apartment/screens/home_screen.dart';
import 'package:apartment/screens/managment_screen.dart';
import 'package:apartment/widgets/themes.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              changeTheme();
            },
            icon: Icon(Icons.chat),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                child: Text("SAKEN"),
                padding: EdgeInsets.only(top: 30, right: 30),
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
            // HomeScreen(),
            // UserProvider.currentuser?.role.name == Role.admin.name
            //     ? ManagmentScreen()
            //     : HomeScreen(),
            HomeScreen(),
            Center(child: Text("jjjjj")),
            Center(child: Text("ooooooooooooooooooooo")),
          ],
        ),
      ),
    );
  }
}
