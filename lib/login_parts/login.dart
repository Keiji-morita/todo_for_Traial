import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  bool _isObscure = true;

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
                child: TextFormField(
                  decoration: const InputDecoration(
                  labelText: 'Mail Address',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
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
                            onPressed: (){},
                            child: Text('ログイン')
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
