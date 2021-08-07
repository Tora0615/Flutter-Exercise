import 'package:firebase_brew_crew_project/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text("Brew Crew"),
        backgroundColor: Colors.brown[400],
        elevation: 0,
        actions: [
          TextButton.icon(
            onPressed: () async {
              await _auth.signOut(); // 會 return null
            },
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            label: Text(
              "logout",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
