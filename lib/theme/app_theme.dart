import 'package:flutter/material.dart';

class AppTheme {
  static var primaryColor = const Color(0xff263184);

  static var appTheme = ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            shape: WidgetStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
            textStyle: WidgetStateProperty.all(const TextStyle(fontSize: 14)),
            elevation: WidgetStateProperty.all(0.0),
            backgroundColor: WidgetStateProperty.all(primaryColor),
            foregroundColor: WidgetStateProperty.all(Colors.white),
            minimumSize: WidgetStateProperty.all(const Size.fromHeight(58)))),
    inputDecorationTheme: InputDecorationTheme(
      errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 217, 217, 217)),
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 217, 217, 217)),
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 217, 217, 217)),
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      border: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 217, 217, 217)),
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
      hintStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      filled: true,
      fillColor: Colors.grey[50],
    ),
  );
}
