import 'package:block_sample/controllers/bloc/counter/counter_bloc.dart';
import 'package:block_sample/controllers/bloc/counter2/cubit/counter2_cubit.dart';
import 'package:block_sample/views/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(
          create: (BuildContext context) => CounterBloc(),
        ),

        BlocProvider<Counter2Cubit>(
          create: (BuildContext context) => Counter2Cubit(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Home2(),
    );
  }
}
