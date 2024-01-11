import 'package:flutter/material.dart';
import 'package:todoey/views/home_screen.dart';
import 'package:todoey/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      home: HomeScreen(),
    );
  }
}
