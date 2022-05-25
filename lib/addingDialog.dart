import 'package:flutter/material.dart';
import 'package:traialtodo/todo_list.dart';


class EditDialog extends StatefulWidget {
  static Future<Todos?> show(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => EditDialog(),
    );
  }

  @override
  _EditDialogState createState() => _EditDialogState();
}

class _EditDialogState extends State<EditDialog> {
  late final TextEditingController _textEditingController;
  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: TextField(
        controller: _textEditingController,
        decoration: InputDecoration(hintText: "TODO"),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(
              context,
              Todos(task: "テスト"),
            );
            
          },
          child: Text("保存"),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}

