import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
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
                            onPressed: (){
                    try {
                          Navigator.pushNamed(context, '/content');
                        } catch (e) {
                      print(e);
                        }
                            },
                            child: Text('新規登録')
                          ),
                        ElevatedButton(
                            onPressed: (){
                              Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => login(),
                              )
                              );
                            },
                            child: Text('アカウントお持ちの方'),
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
