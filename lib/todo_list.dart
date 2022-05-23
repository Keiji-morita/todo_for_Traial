import 'package:flutter/material.dart';

class todoList extends StatefulWidget {
  @override
  _todoListState createState() => _todoListState();
}

class _todoListState extends State<todoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('成功'),
      ),
      body: Center(
        child: Text('新規登録成功！'),
      ),
    );
  }
}