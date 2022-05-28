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
  List<Todo> _todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children:  [
          Expanded(
            child: FutureBuilder<QuerySnapshot>(
                future: FirebaseFirestore.instance
                .collection('todos')
                .get(),
              builder: (context, snapshot) {
                if (snapshot.hasData){
                  final List<DocumentSnapshot> documents = snapshot.data!.docs;
                  return ListView(
                    
                    children : documents.map((documents){
                      return Dismissible(
                        key: Key(documents.id),
                      child: Card(
                          child: ListTile(
                            title: Text(documents['task'])
                          )
                      ),
                      onDismissed: (DismissDirection direction){
                          setState(() async {
                        await FirebaseFirestore.instance
                        .collection('todos')
                        .doc(documents.id)
                        .delete();
                          });
                      }, 
                    );

                  }).toList()
                );
              } 
              //エラーハンドリング
              return Center(
                child: Text("読み込み中")
              );
            }
          )
        ),
      ]
        
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


