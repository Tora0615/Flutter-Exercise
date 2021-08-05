import 'package:firebase_brew_crew_project/models/user.dart';
import 'package:firebase_brew_crew_project/screens/authenticate/authenticate.dart';
import 'package:firebase_brew_crew_project/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // CustomUser 一開始為 null，後來才有值，一定要記得加"?"
    // 沒加 : Error: Could not find the correct
    // Provider<CustomUser> above this Wrapper Widget
    final customUser = Provider.of<CustomUser?>(context);
    print(customUser);  //先印出來看看

    // return either Home or Authenticate widget
    return Authenticate(); //Home()
  }
}



