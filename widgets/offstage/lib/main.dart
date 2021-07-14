import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool offstage = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(

          body: Center(
            child: Offstage(
              offstage: offstage,
              child: Text("文字文字文字",style: TextStyle(fontSize: 30),),
            ),
          ),

          floatingActionButton: FloatingActionButton(
            onPressed: (){
              print("pressed");
              setState(() {
                offstage = !offstage;
              });
            },
            tooltip: "顯示/隱藏",
            child: Icon(Icons.flip),
          ),
        ),
      ),
    );
  }
}
