import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/task_model.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitial([])) {
    on<AddTaskEvent>(addTaskEvent);
    on<DeleteTaskEvent>(deleteTaskEvent);
    on<ToggleTaskEvent>(toggleTaskEvent);
  }

  FutureOr<void> addTaskEvent(AddTaskEvent event, Emitter<TaskState> emitter) {
    final task = Task(
        taskDescription: event.textDescription, isChecked: event.isChecked);

    state.listOfTasks.add(task);
    emit(UpdatedTaskList(state.listOfTasks));
  }

  FutureOr<void> toggleTaskEvent(
      ToggleTaskEvent event, Emitter<TaskState> emit) {
    state.listOfTasks[event.index].isChecked =
        !state.listOfTasks[event.index].isChecked!;
    emit(UpdatedTaskList(state.listOfTasks));
  }

  FutureOr<void> deleteTaskEvent(
      DeleteTaskEvent event, Emitter<TaskState> emit) {
    final task = event.task;
    state.listOfTasks.remove(task);
    emit(UpdatedTaskList(state.listOfTasks));
  }
}
