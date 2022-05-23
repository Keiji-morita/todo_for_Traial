import 'package:flutter/material.dart';
import 'package:traialtodo/todo_list.dart';
import 'login_parts/login.dart';
import 'login_parts/register.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';  


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(Base());
}
class Base extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
              // initialRoute: '/login',
      routes: {
        // '/login': (context) => const login(),
        '/content': (context) =>  todoList(),
        '/register': (context) => register(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: login(),

    );
  }
}