import 'package:flutter/material.dart';

class todoList extends StatefulWidget {
  @override
  _todoListState createState() => _todoListState();
}

class Todo {
  Todo({required this.name, required this.checked});
  final String name;
  bool checked;
}

class _todoListState extends State<todoList> {
  @override
  Widget build(BuildContext context) {
    // String todo = '';
    final TextEditingController todoController = TextEditingController();
    final List<Todo> _todo = <Todo>[];

    

    return Scaffold(
      appBar: AppBar(
        title: Text('成功'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: <Widget> [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  controller: todoController,
                  decoration: const InputDecoration(
                  labelText: 'What is todo ?',
                  ),
                ),
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
              primary: Colors.red,
            ),
              onPressed: (){

              },
              
              child: Text("submit")
              
              ),
          ],
        )
      ),
    );
  }
}