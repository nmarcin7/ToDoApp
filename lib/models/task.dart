import 'package:hive/hive.dart';
part 'task.g.dart';

@HiveType(typeId: 0, adapterName: "TaskAdapter")
class Task extends HiveObject {
  @HiveField(0)
  String? taskDescription;
  @HiveField(1)
  bool? isChecked;
  Task({this.taskDescription, this.isChecked});
}
