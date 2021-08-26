import 'package:flutter/material.dart';
import 'edgeGlowingButton.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Color(0xFF0E1538),
          child: Center(


            child: EdgeGlowingButton(
              mainColor1: Colors.purpleAccent,
              mainColor2: Colors.indigoAccent,
              buttonBackgroundColor: Color(0xFF0E1538),
              onTap: (){
                print("tap");
              },
              textWidget: Text(
                "Button",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                ),
              ),
              outerBorderRadius: 10,
              innerBorderRadius: 7,
              width: 210,
              height: 90,
              padding: 3,
              rotation: 30, //degree
            ),
          ),
        ),
      ),
    );
  }
}


