part of 'task_bloc.dart';

@immutable
abstract class TaskState {}

class TaskInitial extends TaskState {}

class UpdatedTaskState extends TaskState {}

class NewTaskAddedState extends TaskState {}

class TaskDeletedState extends TaskState {}
