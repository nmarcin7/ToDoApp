import 'package:flutter/material.dart';
import 'package:todoey/boxes.dart';

class TaskTile extends StatelessWidget {
  final String text;
  final bool value;

  final Function(bool?)? onChanged;
  final Function(DismissDirection?)? onDismissed;
  final TextDecoration textDecoration;
  const TaskTile({
    super.key,
    required this.text,
    required this.value,
    required this.onChanged,
    required this.textDecoration,
    required this.onDismissed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5, top: 10),
      child: Dismissible(
        direction: DismissDirection.endToStart,
        background: Container(),
        secondaryBackground: Container(
          color: Colors.red,
          child: const Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: 20, top: 5, bottom: 5),
              child: Icon(
                Icons.delete,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ),
        key: Key(tasksBoxes.keys.toString()),
        onDismissed: onDismissed,
        child: ListTile(
          trailing: Checkbox(
            activeColor: Color(0xFF0768FF),
            value: value,
            onChanged: onChanged,
          ),
          tileColor: Theme.of(context).cardColor,
          title: Text(
            text,
            style: TextStyle(
                decoration: textDecoration,
                color: Theme.of(context).textTheme.bodyMedium?.color,
                fontWeight: Theme.of(context).textTheme.bodyMedium?.fontWeight),
          ),
        ),
      ),
    );
  }
}
