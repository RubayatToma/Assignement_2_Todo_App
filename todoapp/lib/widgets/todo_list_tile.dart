// todo_list_tile.dart

import 'package:flutter/material.dart';

class TodoListTile extends StatefulWidget {
  final String title;
  final bool isCompleted;
  final Function(bool?) onCheckboxChanged;
  final Function()? onDeletePressed;

  TodoListTile({
    required this.title,
    required this.isCompleted,
    required this.onCheckboxChanged,
    this.onDeletePressed,
  });

  @override
  _TodoListTileState createState() => _TodoListTileState();
}

class _TodoListTileState extends State<TodoListTile> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.title,
        style: TextStyle(
          decoration: widget.isCompleted
              ? TextDecoration.lineThrough
              : TextDecoration.none,
        ),
      ),
      leading: Checkbox(
        value: widget.isCompleted,
        onChanged: widget.onCheckboxChanged,
      ),
      trailing: isSelected
          ? IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          if (widget.onDeletePressed != null) {
            widget.onDeletePressed!();
          }
        },
      )
          : null,
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
    );
  }
}
