import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart';
import 'package:todo_api/models/todo.dart';

class Todo {
  static String title = "";
  var id;
  static List<dynamic> data = [];
  Todo({required this.id});

  static Future<void> getTodos() async {
    try {
      Response response =
          await get(Uri.parse("https://jsonplaceholder.typicode.com/todos/"));
      data = jsonDecode(response.body);
    } catch (e) {
      print("ERROR HERE: $e");
    }
  }
}
