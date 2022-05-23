import 'package:flutter/material.dart';

import 'login_parts/register.dart';


void main() {
  runApp(Base());
}
class Base extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: register(),
    );
  }
}