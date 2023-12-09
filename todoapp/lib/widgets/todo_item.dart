class ToDoItem {
  final String title;
  bool isCompleted;

  ToDoItem({required this.title, this.isCompleted = false});

  void setCompleted(bool value) {
    isCompleted = value;
  }
}
