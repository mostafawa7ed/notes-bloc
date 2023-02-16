import 'package:flutter/material.dart';

import '../blocs/bloc_exports.dart';
import '../models/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.task,
  });

  final Task task;
  void removeOrDelete(BuildContext cxt, Task task) {
    print(task.isDeleted!);
    task.isDeleted!
        ? cxt.read<TasksBloc>().add(DeleteTask(task: task))
        : cxt.read<TasksBloc>().add(RemoveTask(task: task));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () {
        removeOrDelete(context, task);
      },
      title: Text(
        task.title,
        style: TextStyle(
          decoration: task.isDone == true
              ? TextDecoration.lineThrough
              : TextDecoration.none,
        ),
      ),
      trailing: Checkbox(
          onChanged: task.isDeleted == false
              ? (value) {
                  context.read<TasksBloc>().add(UpdateTask(task: task));
                }
              : null,
          value: task.isDone),
    );
  }
}
