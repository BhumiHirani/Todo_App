import 'package:flutter/material.dart';
import 'todo_list.dart';
void main() => runApp(TodoApp());

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: TodoList(),
    );
  }
}