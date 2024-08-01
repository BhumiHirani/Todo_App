import 'package:flutter/material.dart';
import 'todo.dart';
class TodoDialog extends StatefulWidget {
final Todo? todo;

TodoDialog({this.todo});

@override
_TodoDialogState createState() => _TodoDialogState();
}

class _TodoDialogState extends State<TodoDialog> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.todo?.title ?? '');
    _descriptionController = TextEditingController(text: widget.todo?.description ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.todo == null ? 'Add Todo' : 'Edit Todo'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(labelText: 'Title'),
          ),
          TextField(
            controller: _descriptionController,
            decoration: InputDecoration(labelText: 'Description'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancel',style: TextStyle(color: Colors.red),),
        ),
        TextButton(
          onPressed: () {
            final todo = Todo(
              title: _titleController.text,
              description: _descriptionController.text,
              isCompleted: widget.todo?.isCompleted ?? false,
            );
            Navigator.of(context).pop(todo);
          },
          child: Text('Save',style: TextStyle(color: Colors.green)),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}