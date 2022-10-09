import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todo_app/constants/index.dart';
import 'package:todo_app/models/todo.dart';
import 'package:http/http.dart' as http;
import 'package:todo_app/widgets/todo_card.dart';

class TodosScreen extends StatefulWidget {
  static const routeName = '/todos';

  const TodosScreen({super.key});

  @override
  State<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  late Future<List<Todo>> futureTodos;

  Future<List<Todo>> fetchTodos() async {
    final response = await http.get(Uri.parse('$apiURL/todos'));
    print(response.body);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return (data['todos'] as List)
          .map((todo) => Todo.fromJson(todo))
          .toList();
    } else {}

    throw Exception('Failed to load api');
  }

  @override
  void initState() {
    super.initState();

    futureTodos = fetchTodos();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> items = [
      'Item One',
      'Item Two',
      'Item Three',
      'Item Four',
      'Item Five',
    ];

    return FutureBuilder(
      future: futureTodos,
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          return ListView(
            children: snapshot.data!
                .map(
                  (todo) => TodoCard(
                    todo.id,
                    todo.title,
                    todo.description,
                  ),
                )
                .toList(),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Unable to fetch todos!'),
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
