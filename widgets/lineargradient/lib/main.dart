import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text("begin : (0.0,0.0)\nend : (1.0,1.0)"),
                  Center(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: FractionalOffset(0.0,0.0),
                          end: FractionalOffset(1.0,1.0),
                          colors: [
                            Colors.red,
                            Colors.amber,
                            Colors.green,
                            Colors.blueAccent
                          ],
                        ),
                      ),
                      child: Container(
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                ],
              ),

              Column(
                children: [
                  Text("begin : (0.5,0.5)\nend : (1.0,1.0)"),
                  Center(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: FractionalOffset(0.5,0.5),
                          end: FractionalOffset(1.0,1.0),
                          colors: [
                            Colors.red,
                            Colors.amber,
                            Colors.green,
                            Colors.blueAccent
                          ],
                        ),
                      ),
                      child: Container(
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                ],
              ),

              Column(
                children: [
                  Text("begin : (1.0,0.0)\nend : (1.0,1.0)"),
                  Center(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: FractionalOffset(1.0,0.0),
                          end: FractionalOffset(1.0,1.0),
                          colors: [
                            Colors.red,
                            Colors.amber,
                            Colors.green,
                            Colors.blueAccent
                          ],
                        ),
                      ),
                      child: Container(
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
