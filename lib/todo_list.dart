import 'package:flutter/material.dart';
import 'todo.dart';
import 'add_todo.dart';
class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<Todo> _todos = [];

  void _addTodo() async {
    final result = await showDialog<Todo>(
      context: context,
      builder: (BuildContext context) => TodoDialog(),
    );

    if (result != null) {
      setState(() {
        _todos.add(result);
      });
    }
  }

  void _editTodo(int index) async {
    final result = await showDialog<Todo>(
      context: context,
      builder: (BuildContext context) => TodoDialog(todo: _todos[index]),
    );

    if (result != null) {
      setState(() {
        _todos[index] = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo List')),
      body: ListView.builder(
        itemCount: _todos.length,
        itemBuilder: (context, index) {
          final todo = _todos[index];
          return ListTile(
            title: Text(todo.title, style: TextStyle(decoration: todo.isCompleted ? TextDecoration.lineThrough : null)),
            subtitle: Text(todo.description),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit,color: Colors.black,),
                  onPressed: () => _editTodo(index),
                ),
                IconButton(
                  icon: Icon(Icons.delete,color: Colors.red,),
                  onPressed: () {
                    setState(() {
                      _todos.removeAt(index);
                    });
                  },
                ),
                Checkbox(
                  value: todo.isCompleted,
                  onChanged: (bool? value) {
                    setState(() {
                      todo.isCompleted = value!;
                    });
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTodo,
        child: Icon(Icons.add,color: Colors.blue,),
      ),
    );
  }
}