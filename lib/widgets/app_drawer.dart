// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tapbar/controller/auth_controller.dart';
import 'package:tapbar/controller/favorite_controller.dart';
import 'package:tapbar/controller/login_controller.dart';
import 'package:tapbar/providers/notifications_provider.dart';
import 'package:tapbar/screens/about_us_screen.dart';
import 'package:tapbar/screens/apartment_owner_home.dart';
import 'package:tapbar/screens/booking_screen.dart';
import 'package:tapbar/screens/favorite_screen.dart';
import 'package:tapbar/screens/notification_screen.dart';
import 'package:tapbar/screens/settings_screen.dart';
import 'package:tapbar/widgets/photo.dart';

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
                      CircleAvatar(
                        radius: 28,
                        child: Photo(
                          imageUrl: Get.find<AuthController>()
                              .currentUser
                              .value!
                              .picture,
                        ),
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
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        radius: 28,
                        child: Photo(
                          imageUrl: Get.find<AuthController>()
                              .currentUser
                              .value!
                              .picture,
                        ),
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
            title: 'home'.tr,
            onTap: () {
              Navigator.pop(context);
            },
          ),

          _drawerItem(
            context,
            icon: Icons.chalet,
            title:
                Get.find<AuthController>().currentUser.value!.role.name ==
                    'apartment_owner'
                ? 'owner page'.tr
                : 'my_reservations'.tr,
            onTap: () {
              Get.find<AuthController>().currentUser.value!.role.name ==
                      'apartment_owner'
                  ? Get.to(() => ApartmentOwnerHome())
                  : Get.to(() => BookingScreen());
            },
          ),

          _drawerItem(
            context,
            icon: Icons.favorite,
            title: 'favorites'.tr,
            onTap: () async {
              Get.put(FavoriteController());
              await Get.find<FavoriteController>().getAllFavorite();
              Get.to(() => FavoriteScreen());
            },
          ),

          _drawerItem(
            context,
            icon: Icons.notifications,
            title: 'notifications'.tr,
            onTap: () {
              NotificationsProvider().getAllNotofications();
              Get.to(() => NotificationScreen());
            },
          ),

          _drawerItem(
            context,
            icon: Icons.settings,
            title: 'settings'.tr,
            onTap: () {
              Get.to(() => const SettingsScreen());
            },
          ),

          _drawerItem(
            context,
            icon: Icons.reply_all,
            title: 'rate_us'.tr,
            onTap: () {},
          ),

          const Spacer(),

          _drawerItem(
            context,
            icon: Icons.people,
            title: 'about_us'.tr,
            onTap: () {
              Get.to(() => AboutUsScreen());
            },
          ),

          // LOGOUT
          const Divider(),
          _drawerItem(
            context,
            icon: Icons.logout,
            title: 'logout'.tr,
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
