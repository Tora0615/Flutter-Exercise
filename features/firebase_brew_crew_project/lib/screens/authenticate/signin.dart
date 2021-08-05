import 'package:firebase_brew_crew_project/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0,
        title: Text("Sign in to Brew Crew"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: ElevatedButton(
          child: Text("Sign in anonymous"),
          onPressed: () async{
            dynamic result = await _auth.signInAnon();     // 可能回傳 user or null
            if(result == null){
              print("Singing in error");
            }else{
              print("signed in");
              print(result.uid);  // 原本 print(result);
            }
          },
        ),
      ),
    );
  }
}
