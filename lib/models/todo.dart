import 'package:http/http.dart';
import 'dart:convert';

class TodoModel {
  var title;

  var id;

  TodoModel({
    required this.title,
    required this.id,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json["id"],
      title: json["title"],
    );
  }

  List<TodoModel> todoFromJson(String str) =>
      List<TodoModel>.from(json.decode(str).map((x) => TodoModel.fromJson(x)));
}
