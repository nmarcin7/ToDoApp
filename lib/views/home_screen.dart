import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoey/controllers/blocs/task_bloc.dart';
import '../widgets/task_textfield.dart';
import '../widgets/task_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final taskBloc = TaskBloc();
    final TextEditingController _taskController = TextEditingController();
    return Scaffold(
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
                          taskBloc.add(
                            AddTaskEvent(_taskController.text.trim(), false),
                          );
                          _taskController.clear();
                          Navigator.pop(context);
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
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 40),
                child: CircleAvatar(
                  radius: 30.0,
                  backgroundColor: Color(0xFFFFFFFF),
                  child: Icon(
                    Icons.list,
                    size: 30,
                    color: Color(0xFF2F3862),
                  ),
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Todoey',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'TODAY\'S TASKS',
                  style: Theme.of(context).textTheme.bodyMedium,
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
          );
        },
      ),
    );
  }
}
