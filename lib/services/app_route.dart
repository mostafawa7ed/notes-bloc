import 'package:flutter/material.dart';
import 'package:testbloc/screens/recycle_bin.dart';
import 'package:testbloc/screens/tasks_screen.dart';

class AppRoute {
  Route? onGenertateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RecycleBin.id:
        return MaterialPageRoute(builder: (_) => RecycleBin());
      case TasksScreen.id:
        return MaterialPageRoute(builder: (_) => TasksScreen());
      default:
        return null;
    }
  }
}
