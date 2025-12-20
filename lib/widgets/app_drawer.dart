import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tapbar/controller/auth_controller.dart';
import 'package:tapbar/controller/login_controller.dart';
import 'package:tapbar/widgets/themes.dart';

class AppDrawer extends StatelessWidget {
  LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Drawer(
      child: Column(
        children: [
          isDark
              ? DrawerHeader(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const CircleAvatar(
                        radius: 28,
                        child: Icon(Icons.person, size: 30),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        '${Get.find<AuthController>().currentUser.value!.firstName} ${Get.find<AuthController>().currentUser.value!.lastName}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${Get.find<AuthController>().currentUser.value!.phone}",
                        style: const TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                )
              : DrawerHeader(
                  decoration: BoxDecoration(
                    color: Theme.of(context).appBarTheme.backgroundColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        radius: 28,
                        child: Icon(Icons.person, size: 30),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        '${Get.find<AuthController>().currentUser.value!.firstName} ${Get.find<AuthController>().currentUser.value!.lastName}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "${Get.find<AuthController>().currentUser.value!.phone}",
                        style: const TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ),

          _drawerItem(
            context,
            icon: Icons.home,
            title: "Home",
            onTap: () {
              Navigator.pop(context);
            },
          ),

          _drawerItem(
            context,
            icon: isDark ? Icons.light_mode : Icons.dark_mode,
            title: "Change Theme",
            color: isDark ? Colors.white : Colors.black,
            onTap: () {
              Navigator.pop(context);
              changeTheme();
            },
          ),
          _drawerItem(
            context,
            icon: Icons.notifications,
            title: "Notifications",
            onTap: () {},
          ),

          _drawerItem(
            context,
            icon: Icons.settings,
            title: "Settings",
            onTap: () {},
          ),

          const Spacer(),

          // LOGOUT
          const Divider(),
          _drawerItem(
            context,
            icon: Icons.logout,
            title: "Logout",
            color: Colors.red,
            onTap: () {
              loginController.logout();
            },
          ),
        ],
      ),
    );
  }

  Widget _drawerItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    Color? color,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title, style: TextStyle(color: color)),
      onTap: onTap,
    );
  }
}
