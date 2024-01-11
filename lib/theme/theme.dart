import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Color(0xFFF8F9FE),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF0669FF),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      fontSize: 24.0,
      color: Color(0xFF2F3862),
    ),
    bodyMedium: TextStyle(
      color: Color(0xFF9393C1),
      fontSize: 14.0,
    ),
    bodySmall: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
  ),
);
