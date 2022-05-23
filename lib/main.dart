import 'package:flutter/material.dart';
import 'package:traialtodo/todo_list.dart';
import 'login_parts/register.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Base());
}
class Base extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
              initialRoute: '/register',
      routes: {
        '/register': (context) => const register(),
        '/content': (context) =>  todoList(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),

    );
  }
}