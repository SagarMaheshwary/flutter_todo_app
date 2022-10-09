import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final int id;
  final String title;
  final String description;

  const TodoCard(this.id, this.title, this.description, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text(title),
            subtitle: Text(description),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: [
              IconButton(
                color: Colors.blue,
                splashRadius: 24,
                iconSize: 20,
                onPressed: () {},
                icon: const Icon(Icons.edit),
              ),
              IconButton(
                color: Colors.red,
                splashRadius: 24,
                iconSize: 20,
                onPressed: () {},
                icon: const Icon(Icons.delete),
              ),
            ],
          )
        ],
      ),
    );
  }
}
