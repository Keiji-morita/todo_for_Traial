import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login.dart';
import 'package:traialtodo/main.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  final _auth = FirebaseAuth.instance;
  
  bool _isObscure = true;
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('アカウント作成'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  onChanged: (value){
                    email = value;
                  },
                  decoration: const InputDecoration(
                  labelText: 'Mail Address',

                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  onChanged: (value){
                    password = value;
                  },
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: IconButton(
                      icon: Icon(_isObscure
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      })),
                ),
              ),

              Center(
                child: Column(
                    children: [
                        ElevatedButton(
                      onPressed: ()async {
                              try {
                              final newUser = await _auth.createUserWithEmailAndPassword(
                              email: email, password: password);
                              if (newUser != null) {
                              Navigator.pushNamed(context, '/content');
                              }
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'email-already-in-use') {
                                  print('指定したメールアドレスは登録済みです');
                            } else if (e.code == 'invalid-email') {
                                  print('メールアドレスのフォーマットが正しくありません');
                            } else if (e.code == 'operation-not-allowed') {
                                  print('指定したメールアドレス・パスワードは現在使用できません');
                            } else if (e.code == 'weak-password') {
                                  print('パスワードは６文字以上にしてください');
                              }
                            }
                          },
                            child: Text('新規登録')
                          ),
                      ],
                  ),
              )
                ],
              ),
            
          ),
        ),
      );
    }
  }
