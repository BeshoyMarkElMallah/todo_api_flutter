import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:todo_api/services/todo_service.dart';

class TodosScreen extends StatefulWidget {
  const TodosScreen({Key? key}) : super(key: key);
  static String routename = '/todoscreen';

  @override
  State<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  List<dynamic>? data;
  var _checked = false;
  List<dynamic> titles = [];

  getData(context) async {
    data = ModalRoute.of(context)?.settings.arguments as List;
    data?.forEach((element) {
      titles.add(element);
    });
  }

  @override
  Widget build(BuildContext context) {
    getData(context);
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30.0,
                  child: Icon(
                    Icons.list,
                    size: 30.0,
                    color: Colors.purple,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  'Todo',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '${data?.length} Tasks',
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(titles[index]['title']),
                    onDismissed: (direction) {
                      setState(() {
                        titles.removeAt(index);
                        data?.removeAt(index);
                      });
                    },
                    child: ListTile(
                      title: Text(
                        titles[index]['title'].toString(),
                        style: TextStyle(
                            fontSize: 20,
                            decoration: titles[index]['completed']
                                ? TextDecoration.lineThrough
                                : null),
                      ),
                      leading: Checkbox(
                          activeColor: Colors.purple,
                          value: titles[index]['completed'],
                          onChanged: (value) {
                            setState(() {
                              titles[index]['completed'] = value!;
                            });
                          }),
                    ),
                  );
                },
                itemCount: titles.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
