import 'package:flutter/material.dart';
import 'package:testbloc/screens/recycle_bin.dart';
import 'package:testbloc/screens/tasks_screen.dart';
import '../blocs/bloc_exports.dart';
import '../blocs/switch1_bloc/switch1_bloc.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({Key? key}) : super(key: key);

  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
          child: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.grey,
            child: Text(
              "Task Drawer",
              style: Theme.of(context).textTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
          ),
          BlocBuilder<TasksBloc, TasksState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () =>
                    Navigator.of(context).pushReplacementNamed(TasksScreen.id),
                child: ListTile(
                  leading: const Icon(Icons.folder_special),
                  trailing: Text("${state.allTasks.length}"),
                  title: const Text("My Task"),
                ),
              );
            },
          ),
          Divider(),
          BlocBuilder<TasksBloc, TasksState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () =>
                    Navigator.of(context).pushReplacementNamed(RecycleBin.id),
                child: ListTile(
                  leading: Icon(Icons.delete),
                  trailing: Text("${state.removedTasks.length}"),
                  title: Text("Bin"),
                ),
              );
            },
          ),
          BlocBuilder<Switch1Bloc, Switch1State>(
            builder: (context, state) {
              return Switch(
                  value: state.switchValue,
                  onChanged: (newValue) {
                    state.switchValue
                        ? context.read<Switch1Bloc>().add(SwitchOffEvent())
                        : context.read<Switch1Bloc>().add(SwitchOnEvent());
                  });
            },
          )
        ],
      )),
    );
  }
}
