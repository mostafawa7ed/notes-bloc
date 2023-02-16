// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:testbloc/blocs/bloc_exports.dart';
import 'package:testbloc/widget/task_tile.dart';
import '../models/task.dart';

class TaskList extends StatelessWidget {
  const TaskList({Key? key, required this.tasksList}) : super(key: key);
  final List<Task> tasksList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: tasksList.length,
        itemBuilder: (context, i) {
          Task task = tasksList[i];
          return TaskTile(task: task);
        });
  }
}
