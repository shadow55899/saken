import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:tapbar/controller/auth_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: Colors.grey,
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: isDark ? null : Colors.white,
                  foregroundColor: isDark ? null : Colors.black,
                  radius: 28,
                  child: Icon(Icons.person, size: 30),
                ),
                const SizedBox(width: 12),
                Text(
                  'ِUsername: ${Get.find<AuthController>().currentUser.value!.firstName} ${Get.find<AuthController>().currentUser.value!.lastName} \n Phone Number:${Get.find<AuthController>().currentUser.value!.phone}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.dark_mode),
            title: const Text('Dark Mode'),
            trailing: Switch(
              value: isDark,
              onChanged: (value) {
                Get.changeThemeMode(value ? ThemeMode.dark : ThemeMode.light);
              },
            ),
          ),
          ListTile(
            leading: const Icon(Icons.delete),
            onTap: () {
              // Get.find<AuthController>().deleteUser();
            },
            title: const Text(
              'Delete My Account',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
