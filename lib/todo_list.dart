import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'addingDialog.dart';

class todoList extends StatefulWidget {
  @override
  _todoListState createState() => _todoListState();
}

class Todos {
  final String task;
  final bool isdone;

  Todos({required this.task, this.isdone = false});
}

class _todoListState extends State<todoList> {
  @override
  Widget build(BuildContext context) {
    // String todo = '';
    final TextEditingController todoController = TextEditingController();
    final List<Todos> _todo = [
      Todos(task: "牛乳"),
      Todos(task: "パンケーキ"),
    ];

  return Scaffold(
      appBar: AppBar(
        title: Text('成功'),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
                    itemCount: _todo.length, 
                    itemBuilder: (context,index) { 
                    final  todo = _todo[index];
                  
                    return ListTile(
                      title: Text(todo.task),
                      trailing: Checkbox(
                        value: todo.isdone,
                    onChanged: (checked) {
                      setState(() {
                        _todo[index] = Todos(task: todo.task, isdone: checked ?? true);
                            });
                          }
                      ),
                    );
                  }
              ),
          
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () async{
              final addedtodo = await EditDialog.show(context);
              if (addedtodo != null) {
                setState(() {
                  _todo.add(addedtodo);
                });
              }

              print(_todo);
            },

            
          ),
        );
      
    
  }
}

