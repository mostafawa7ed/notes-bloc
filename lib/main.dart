import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:testbloc/blocs/bloc_exports.dart';
import 'package:testbloc/blocs/switch1_bloc/switch1_bloc.dart';
import 'package:testbloc/services/app_route.dart';
import 'package:testbloc/services/path_theme.dart';
import 'screens/tasks_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Bloc.observer = MyBlocObserver();  //this line to listener to class Ovserver
  //Bloc.transformer = myEventTransformer();
  //WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      //save direct
      storageDirectory: await getApplicationDocumentsDirectory());
  // Bloc.observer = AppObserver();
  //await initBlocsAndDependencies();
  //Bloc.observer;
  runApp(MyApp(
    appRoute: AppRoute(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRoute}) : super(key: key);
  final AppRoute appRoute;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TasksBloc()),
        BlocProvider(create: (context) => Switch1Bloc()),
      ],
      // ..add(AddTask(
      //     task: Task(title: "title1"))), //here add event manual on bloc
      child: BlocBuilder<Switch1Bloc, Switch1State>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Tasks App',
            theme:
                !state.switchValue ? AppTheme.lightTheme : AppTheme.darkTheme,
            //   ? ThemeData(brightness: Brightness.light)
            //   : ThemeData(brightness: Brightness.dark),
            //  ? AppThemes.appThemeData[AppTheme.darkTheme]
            // : AppThemes.appThemeData[AppTheme.lightTheme],
            home: const TasksScreen(),
            onGenerateRoute: appRoute.onGenertateRoute,
          );
        },
      ),
    );
  }
}
