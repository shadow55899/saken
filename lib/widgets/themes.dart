// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';

class Themes {
  static ThemeData myLightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: const Color(0xFFF5F5F5), // light beige
    primaryColor: const Color(0xFF5A7867), // muted green
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF5A7867),
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Color(0xFF5A7867)), // typed text color
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Color(0xFF5A7867)),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all(Color(0xFF5A7867)),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(color: Color(0xFF5A7867)), // same as border color
      hintStyle: TextStyle(color: Color(0xFF5A7867)), // placeholder text
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: Color(0xFF5A7867)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: Color(0xFF5A7867)),
      ),
      prefixIconColor: Color(0xFF5A7867),
      suffixIconColor: Color(0xFF5A7867),
    ),
  );

  static ThemeData myDarkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: const Color(0xFF0D1B2A), // deep navy blue
    primaryColor: const Color(0xFF1B263B), // medium-dark blue
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1B263B), // matches primary
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Color(0xFFBFC9D6)), // soft light blue-gray
      titleLarge: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 22,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Color(0xFF415A77),
        ), // steel blue
        foregroundColor: MaterialStateProperty.all(Colors.white),
        minimumSize: MaterialStateProperty.all(Size(200, 50)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all(Color(0xFF415A77)), // matches button
      checkColor: MaterialStateProperty.all(Colors.white),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFF1B263B),
      labelStyle: TextStyle(color: Color(0xFFBFC9D6)),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: Color(0xFF415A77)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: Color(0xFF778DA9)),
      ),
      prefixIconColor: Color(0xFF778DA9),
      suffixIconColor: Color(0xFF778DA9),
    ),
  );
}

void changeTheme() {
  if (Get.isDarkMode) {
    Get.changeThemeMode(ThemeMode.light);
  } else {
    Get.changeThemeMode(ThemeMode.dark);
  }
}
