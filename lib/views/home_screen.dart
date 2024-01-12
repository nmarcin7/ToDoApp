import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoey/controllers/blocs/task_bloc.dart';
import 'package:todoey/controllers/cubits/theme_cubit.dart';
import '../widgets/task_textfield.dart';
import '../widgets/task_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final taskBloc = TaskBloc();
    final TextEditingController _taskController = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        'New task',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TaskTextfield(textEditingController: _taskController),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            Color(0xFF0669FF),
                          ),
                          minimumSize: MaterialStatePropertyAll(
                            Size.fromHeight(50),
                          ),
                        ),
                        onPressed: () {
                          if (_taskController.text.isNotEmpty) {
                            taskBloc.add(
                              AddTaskEvent(_taskController.text.trim(), false),
                            );

                            _taskController.clear();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Color(0xFF303030),
                                duration: Duration(seconds: 1),
                                content: Text(
                                  'New task has been added',
                                ),
                              ),
                            );
                            Navigator.pop(context);
                          }
                        },
                        child: const Text(
                          'Add',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
      body: BlocBuilder<TaskBloc, TaskState>(
        bloc: taskBloc,
        builder: (context, state) {
          return SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'TODAY\'S TASKS',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.listOfTasks.length,
                    itemBuilder: (context, index) {
                      final task = state.listOfTasks[index];
                      return TaskTile(
                        onDismissed: (DismissDirection) {
                          taskBloc.add(DeleteTaskEvent(task));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(seconds: 1),
                              content: Text(
                                'Task has been deleted',
                              ),
                            ),
                          );
                        },
                        textDecoration: task.isChecked!
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        text: task.taskDescription!,
                        value: task.isChecked!,
                        onChanged: (isChecked) {
                          taskBloc.add(
                            ToggleTaskEvent(
                                isChecked: task.isChecked!, index: index),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
