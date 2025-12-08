import 'package:apartment/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static RxString baseUrl = "http://192.168.1.111:8000/api".obs;
  // change to your backend URL
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      theme: Themes.myLightTheme,
      darkTheme: Themes.myDarkTheme,
      themeMode: ThemeMode.system,
    );
  }
}
