// ignore: depend_on_referenced_packages
import 'package:equatable/equatable.dart';
import 'package:testbloc/models/task.dart';
import '../bloc_exports.dart';
part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends HydratedBloc<TasksEvent, TasksState> {
  //this class have a state that change from insert and update ,delete so ...
  //can get it using a this.state
  TasksBloc() : super(const TasksState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
    on<RemoveTask>(_onRemoveTask);
  }
  void _onAddTask(AddTask event, Emitter<TasksState> emit) {
    //take from event in state
    final state = this.state;
    emit(TasksState(
      allTasks: List.from(state.allTasks)..add(event.task),
      removedTasks: state.removedTasks,
    ));
  }

  void _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;
    final int index = state.allTasks.indexOf(task);
    List<Task> allTasks = List.from(state.allTasks)..remove(task);
    task.isDone == false
        ? allTasks.insert(index, task.copyWith(isDone: true))
        : allTasks.insert(index, task.copyWith(isDone: false));
    emit(TasksState(allTasks: allTasks, removedTasks: state.removedTasks));
  }

  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) {
    List<Task> removedTasks = List.from(state.removedTasks)..remove(event.task);
    emit(TasksState(removedTasks: removedTasks, allTasks: state.allTasks));
  }

  void _onRemoveTask(RemoveTask event, Emitter<TasksState> emit) {
    List<Task> allTask = List.from(state.allTasks)..remove(event.task);
    List<Task> removedTask = List.from(state.removedTasks)
      ..add(event.task.copyWith(isDeleted: true));
    print("${event.task.copyWith().isDeleted}");
    emit(TasksState(allTasks: allTask, removedTasks: removedTask));
  }

  @override
  TasksState? fromJson(Map<String, dynamic> json) {
    return TasksState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TasksState state) {
    return state.toMap();
  }
}
