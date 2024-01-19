import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todoey/boxes.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/views/home_screen.dart';
import 'package:todoey/theme/theme.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(TaskAdapter());
  tasksBoxes = await Hive.openBox<Task>('tasksBox');

  runApp(
    const MyApp(),
  );
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
