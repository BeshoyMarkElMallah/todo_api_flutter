import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:todo_api/screens/todo_screen.dart';
import 'package:todo_api/services/todo_service.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void setupTodo() async {
    await Todo.getTodos();
    print(Todo.data);
    Navigator.pushNamed(context, TodosScreen.routename, arguments: Todo.data);
  }

  @override
  void initState() {
    super.initState();
    setupTodo();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: SpinKitPouringHourGlassRefined(
        color: Colors.blue,
        size: 150.0,
      )),
    );
  }
}
