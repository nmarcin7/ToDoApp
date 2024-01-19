part of 'task_bloc.dart';

@immutable
abstract class TaskEvent {}

class AddTaskEvent extends TaskEvent {
  final String textDescription;
  final int index;
  final bool isChecked;

  AddTaskEvent(this.textDescription, this.isChecked, this.index);
}

class DeleteTaskEvent extends TaskEvent {
  final int index;

  DeleteTaskEvent(this.index);
}

class ToggleTaskEvent extends TaskEvent {
  dynamic value;
  int index;

  ToggleTaskEvent({required this.value, required this.index});
}
