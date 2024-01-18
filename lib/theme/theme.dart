import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  appBarTheme: const AppBarTheme(
    color: Color(0xFF640BE5),
  ),
  brightness: Brightness.light,
  scaffoldBackgroundColor: Color(0xFFF8F8F8),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF0DD7C0),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      fontSize: 24.0,
      color: Color(0xFF2F3862),
    ),
    bodyMedium: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
    bodySmall: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
  ),
);
