import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todoey/boxes.dart';

import '../../models/task.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  int _nextId = 0;
  TaskBloc() : super(TaskInitial()) {
    on<AddTaskEvent>(addTaskEvent);
    on<DeleteTaskEvent>(deleteTaskEvent);
    on<ToggleTaskEvent>(toggleTaskEvent);
  }

  FutureOr<void> addTaskEvent(
      AddTaskEvent event, Emitter<TaskState> emitter) async {
    _nextId++;
    await tasksBoxes.put(
        _nextId,
        Task(
            taskDescription: event.textDescription,
            isChecked: event.isChecked));

    emit(NewTaskAddedState());
  }

  FutureOr<void> toggleTaskEvent(
      ToggleTaskEvent event, Emitter<TaskState> emit) async {
    await tasksBoxes.putAt(event.index, event.value);
    emit(UpdatedTaskState());
  }

  FutureOr<void> deleteTaskEvent(
      DeleteTaskEvent event, Emitter<TaskState> emit) async {
    await tasksBoxes.deleteAt(event.index);
    emit(TaskDeletedState());
  }
}
