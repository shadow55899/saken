import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:tapbar/controller/auth_controller.dart';
import 'package:tapbar/controller/register_controller.dart';
import 'package:tapbar/widgets/photo.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RegisterController());
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
                  child: Photo(
                    imageUrl:
                        Get.find<AuthController>().currentUser.value!.picture,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'ِUsername: ${Get.find<AuthController>().currentUser.value!.firstName} ${Get.find<AuthController>().currentUser.value!.lastName} \n Phone Number:${Get.find<AuthController>().currentUser.value!.phone} \n Birth Date:${Get.find<AuthController>().currentUser.value!.dateOfBirth.day}-${Get.find<AuthController>().currentUser.value!.dateOfBirth.month}-${Get.find<AuthController>().currentUser.value!.dateOfBirth.year} \n Role:${Get.find<AuthController>().currentUser.value!.role.name}',
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
              _openDialog(context);
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

  void _openDialog(BuildContext context) async {
    final password = await showConfirmPasswordDialog(context);

    if (password != null) {
      print("Confirmed password: $password");
      // Continue your logic here
    }
  }
}

Future<String?> showConfirmPasswordDialog(BuildContext context) {
  final TextEditingController passwordController = TextEditingController();

  return showDialog<String>(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        title: const Text("Confirm Password"),
        content: TextField(
          controller: passwordController,
          obscureText: true,
          decoration: const InputDecoration(labelText: "Password"),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Get.find<RegisterController>().delete(passwordController.text);
            },
            child: const Text("Confirm"),
          ),
        ],
      );
    },
  );
}
