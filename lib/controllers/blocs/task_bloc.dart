import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todoey/boxes.dart';

import '../../models/task.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitial([])) {
    on<AddTaskEvent>(addTaskEvent);
    on<DeleteTaskEvent>(deleteTaskEvent);
    on<ToggleTaskEvent>(toggleTaskEvent);
  }

  FutureOr<void> addTaskEvent(
      AddTaskEvent event, Emitter<TaskState> emitter) async {
    final task = Task(
        taskDescription: event.textDescription, isChecked: event.isChecked);

    state.listOfTasks.add(task);

    await tasksBoxes.put(
        event.textDescription,
        Task(
            taskDescription: event.textDescription,
            isChecked: event.isChecked));

    emit(UpdatedTaskList(state.listOfTasks));
  }

  FutureOr<void> toggleTaskEvent(
      ToggleTaskEvent event, Emitter<TaskState> emit) async {
    await tasksBoxes.putAt(event.index, event.value);

    emit(UpdatedTaskList(state.listOfTasks));
  }

  FutureOr<void> deleteTaskEvent(
      DeleteTaskEvent event, Emitter<TaskState> emit) async {
    await tasksBoxes.deleteAt(event.index);

    emit(UpdatedTaskList(state.listOfTasks));
  }
}
