import 'package:flutter/material.dart';
import 'package:todo_api/screens/loading_screen.dart';
import 'package:todo_api/screens/todo_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoadingScreen(),
      routes: {
        TodosScreen.routename: (ctx) => TodosScreen(),
      },
    );
  }
}
