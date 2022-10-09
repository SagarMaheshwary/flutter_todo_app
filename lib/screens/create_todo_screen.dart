import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:todo_app/constants/index.dart';

class CreateTodoScreen extends StatefulWidget {
  static const routeName = '/create-todo';

  const CreateTodoScreen({super.key});

  @override
  State<CreateTodoScreen> createState() => _CreateTodoScreenState();
}

class _CreateTodoScreenState extends State<CreateTodoScreen> {
  final _formKey = GlobalKey<FormState>();
  final titleInputController = TextEditingController();
  final descriptionInputController = TextEditingController();

  Future<void> createTodo(
    String title,
    String description,
    VoidCallback onSuccess,
  ) async {
    final response = await http.post(
      Uri.parse('$apiURL/todos'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
        <String, String>{
          'title': title,
          'description': description,
        },
      ),
    );

    if (response.statusCode == 201) {
      onSuccess.call();
    }

    throw Exception('Unable to create todo!');
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    titleInputController.dispose();
    descriptionInputController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Title',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Title is required.';
                }

                return null;
              },
              controller: titleInputController,
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Description',
              ),
              controller: descriptionInputController,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 24,
              ),
              child: Center(
                child: ElevatedButton(
                  child: const Text('Submit'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      createTodo(
                        titleInputController.text,
                        descriptionInputController.text,
                        () => Navigator.of(context).pushReplacementNamed('/'),
                      );
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
