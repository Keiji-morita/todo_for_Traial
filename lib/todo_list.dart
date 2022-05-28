import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'addingDialog.dart';

class todoList extends StatefulWidget {
  @override
  _todoListState createState() => _todoListState();
}

class Todo {
    String title;
    bool isdone;

  Todo({required this.title, this.isdone = false});
}

class _todoListState extends State<todoList> {
  List<Todo> _todos = [
    Todo(title: "牛乳"),
    Todo(title: "じゃがいも"),
    Todo(title: "にんじん"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _todos.length,
        itemBuilder: (context, index) {
          final todo = _todos[index];

          return new Dismissible(
            
            child: new Card(

                  child: ListTile(
                    title: Text(todo.title),
                    trailing: Checkbox(
                      value: todo.isdone,
                      onChanged: (checked) {
                        setState(() {
                          _todos[index] = Todo(title: todo.title, isdone: checked ?? false);
                        });
                      },
                    ),
                    onLongPress: () async {
                      final result = await EditDialog.show(context, );
                      if (result != null) {
                        setState(() {
                          _todos[index] = result;
                        });
                      }
                    },
                  ),
                
              ),
                            onDismissed: (DismissDirection direction) {
                setState(() {
                  _todos.removeAt(index);
                });
              }, key: ValueKey<int>(_todos.length),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final result = await EditDialog.show(context);
          if (result != null) {
            setState(() {
              _todos.add(result);
            });
          }
        },
      ),
    );

  }
}

