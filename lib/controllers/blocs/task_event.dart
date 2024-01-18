part of 'task_bloc.dart';

@immutable
abstract class TaskEvent {}

class AddTaskEvent extends TaskEvent {
  final String textDescription;
  final bool isChecked;

  AddTaskEvent(this.textDescription, this.isChecked);
}

class DeleteTaskEvent extends TaskEvent {
  final int index;

  DeleteTaskEvent(this.index);
}

class ToggleTaskEvent extends TaskEvent {
  // bool isChecked;
  dynamic value;
  int index;

  ToggleTaskEvent({required this.value, required this.index});
}
