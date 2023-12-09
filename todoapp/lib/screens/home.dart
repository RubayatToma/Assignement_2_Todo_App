import 'package:flutter/material.dart';
import 'package:todoapp/constants/colors.dart';
import 'package:todoapp/widgets/search.dart';
import 'package:todoapp/widgets/todo_item.dart';
import 'package:todoapp/widgets/todo_list_tile.dart';
import 'package:todoapp/widgets/add_todo_bottom_sheet.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController = TextEditingController();
  List<ToDoItem> todoList = [
    ToDoItem(title: 'Do Gym'),
    ToDoItem(title: 'Eat Food'),
    ToDoItem(title: 'Sleep', isCompleted: true),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.menu,
              color: primaryColor,
              size: 30,
            ),
            Text(
              'My Tasks',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              Icons.beach_access,
              color: Colors.black,
              size: 36.0,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          CustomSearchBar(
            controller: searchController,
            onSubmitted: (value) {
              // Handle search submission here
              print('Search submitted: $value');
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (context, index) {
                return TodoListTile(
                  title: todoList[index].title,
                  isCompleted: todoList[index].isCompleted,
                  onCheckboxChanged: (value) {
                    setState(() {
                      todoList[index].setCompleted(value!);
                    });
                  },
                  onDeletePressed: () {
                    _showDeleteConfirmationDialog(index);
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTodoBottomSheet(context);
        },
        child: Icon(Icons.add),
        backgroundColor: primaryColor,
      ),
    );
  }

  void _showAddTodoBottomSheet(BuildContext context) {
    TextEditingController newTodoController = TextEditingController();

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return AddTodoBottomSheet(
          onAddTodo: (newTodo) {
            // Add new todo item to the list
            setState(() {
              todoList.add(ToDoItem(title: newTodo));
            });
          },
        );
      },
    );
  }

  void _showDeleteConfirmationDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Todo'),
          content: Text('Are you sure you want to delete this todo?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Delete the todo item
                setState(() {
                  todoList.removeAt(index);
                });
                Navigator.pop(context);
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}