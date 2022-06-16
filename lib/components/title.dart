import 'package:flutter/material.dart';

class CompTitle extends StatelessWidget {
  final int todosCount;

  CompTitle({required this.todosCount});

  @override
  Widget build(BuildContext context) {
    return Text(
      todosCount == 0 ? 'ToDoを追加してください' : '残りのToDo数:$todosCount',
      style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 251, 70, 130)),
    );
  }
}
