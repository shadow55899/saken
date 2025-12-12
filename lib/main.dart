import 'package:apartment/controller/auth_controller.dart';
import 'package:apartment/screens/main_screen.dart';
import 'package:apartment/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Get.put(AuthController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static RxString baseUrl = "http://192.168.1.107:8000/api".obs;
  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Obx(() {
        return authController.isLoggedIn.value
            ? MainScreen()
            : LoginScreen();
      }),
      theme: Themes.myLightTheme,
      darkTheme: Themes.myDarkTheme,
      themeMode: ThemeMode.system,
    );
  }
}
