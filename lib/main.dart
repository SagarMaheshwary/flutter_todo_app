import 'package:flutter/material.dart';
import 'package:todo_app/screens/create_todo_screen.dart';
import 'package:todo_app/screens/tabs_screen.dart';
import 'package:todo_app/screens/todos_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': ((context) => const TabsScreen()),
          TodosScreen.routeName: (context) => TodosScreen(),
          CreateTodoScreen.routeName: ((context) => CreateTodoScreen()),
        });
  }
}
