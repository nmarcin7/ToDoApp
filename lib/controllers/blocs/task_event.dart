part of 'task_bloc.dart';

@immutable
abstract class TaskEvent {}

class AddTaskEvent extends TaskEvent {
  final String textDescription;
  final bool isChecked;
  AddTaskEvent(this.textDescription, this.isChecked);
}

class DeleteTaskEvent extends TaskEvent {
  final Task task;
  DeleteTaskEvent(this.task);
}

class ToggleTaskEvent extends TaskEvent {
  bool isChecked;
  int index;
  ToggleTaskEvent({required this.isChecked, required this.index});
}
