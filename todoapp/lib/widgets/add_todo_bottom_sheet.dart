// add_todo_bottom_sheet.dart

import 'package:flutter/material.dart';

class AddTodoBottomSheet extends StatelessWidget {
  final Function(String) onAddTodo;

  AddTodoBottomSheet({required this.onAddTodo});

  @override
  Widget build(BuildContext context) {
    TextEditingController newTodoController = TextEditingController();

    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Add Todo',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          TextField(
            controller: newTodoController,
            decoration: InputDecoration(
              hintText: 'Enter todo...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              // Add new todo item to the list
              String newTodo = newTodoController.text;
              if (newTodo.isNotEmpty) {
                onAddTodo(newTodo);
              }

              // Close the bottom sheet
              Navigator.pop(context);
            },
            child: Text('Add Todo'),
          ),
        ],
      ),
    );
  }
}
