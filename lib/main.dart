import 'package:flutter/material.dart';
import 'package:flutter_application_bloc/bloc_builder/bloc_builder.dart';
import 'package:flutter_application_bloc/cubit/cubit.dart';
//import 'package:flutter_application_bloc/stream/stream.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter BLOC',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocBuilderPage(),
    );
  }
}
