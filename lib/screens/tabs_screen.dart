import 'package:flutter/material.dart';
import 'package:todo_app/screens/create_todo_screen.dart';
import 'package:todo_app/screens/todos_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pages = [
    {
      'page': const TodosScreen(),
      'title': 'Todos',
    },
    {
      'page': const CreateTodoScreen(),
      'title': 'Create Todo',
    }
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int i) {
    setState(() {
      _selectedPageIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title'].toString()),
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.lightBlue[100],
        backgroundColor: Colors.blue,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.task),
            label: 'Todos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task),
            label: 'Create Todo',
          ),
        ],
      ),
    );
  }
}
