import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:traialtodo/login_parts/register.dart';

import '../todo_list.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
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
                            child: Text('ログイン'),
                              onPressed: () async {
                    try {
                      // メール/パスワードでログイン
                      final FirebaseAuth auth = FirebaseAuth.instance;
                      await auth.signInWithEmailAndPassword(
                        email: email,
                        password: password,
                      );
                      // ログインに成功した場合
                      // チャット画面に遷移＋ログイン画面を破棄
                      await Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) {
                          return todoList();
                        }),
                      );
                    } catch (e) {
                      // ログインに失敗した場合
                      setState(() {
                        // infoText = "ログインに失敗しました：${e.toString()}";
                        print('error');
                      });
                    }
                  },
                    
                ),
                      
                        ElevatedButton(
                            onPressed: (){
                              Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => register(),
                              )
                              );
                            },
                            child: Text('ユーザー登録はこちらから'),
                              style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                          ),
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
