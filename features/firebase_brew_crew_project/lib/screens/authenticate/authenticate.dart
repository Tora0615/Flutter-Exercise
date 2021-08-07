import 'package:flutter/material.dart';
import 'package:firebase_brew_crew_project/screens/authenticate/register.dart';
import 'package:firebase_brew_crew_project/screens/authenticate/signin.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Register(),  //SignIn(),
    );
  }
}

