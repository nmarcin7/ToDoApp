part of 'task_bloc.dart';

@immutable
abstract class TaskState {
  List<Task> listOfTasks = [];
  TaskState(this.listOfTasks);
}

class TaskInitial extends TaskState {
  TaskInitial(super.listOfTasks);
}

class UpdatedTaskList extends TaskState {
  UpdatedTaskList(super.listOfTasks);
}
