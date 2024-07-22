import 'package:brain_task_app/app/screens/home/bloc/home_bloc.dart';
import 'package:brain_task_app/app/screens/home/home_screen.dart';
import 'package:brain_task_app/app/screens/navigator/bloc/main_navigator_bloc.dart';
import 'package:brain_task_app/app/screens/navigator/main_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BrainTaskApp extends StatelessWidget {
  const BrainTaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeBloc()..add(HomeLoad()),
          ),
          BlocProvider(
            create: (context) => MainNavigatorBloc()..add(MainNavigatorLoad()),
          ),
        ],
        child: MaterialApp(
          builder: (BuildContext context, Widget? child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaleFactor: 1.0,
              ),
              child: child!,
            );
          },
          debugShowCheckedModeBanner: false,
          title: 'Brain App',
          home: CustomNavigationBar(),
        ));
  }
}
