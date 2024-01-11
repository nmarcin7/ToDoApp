import 'package:flutter/material.dart';

class TaskTextfield extends StatelessWidget {
  TextEditingController textEditingController = TextEditingController();
  TaskTextfield({
    super.key,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(hintText: "Task description..."),
      ),
    );
  }
}
