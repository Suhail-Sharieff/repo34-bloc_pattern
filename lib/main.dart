import 'package:bloc_pattern/_01_Cubit/_01_counter.dart';
import 'package:bloc_pattern/_01_Cubit/_02_multiple_page.dart';
import 'package:bloc_pattern/_02_bloc/_01_counter_bloc.dart';
import 'package:bloc_pattern/_02_bloc/_02_todo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=>Couter_Cubit()),
        BlocProvider(create: (_)=>Couter_Bloc()),
        BlocProvider(create: (_)=>TodoBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const TodoThree(),
      ),
    );
  }
}
