import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                Column(
                  children: [
                    Text("繞著X軸(橫向的軸)旋轉"),
                    Container(
                      color: Colors.grey,
                      child: Transform(
                        transform: Matrix4.rotationX(0.5),
                        child: Container(
                          padding: EdgeInsets.all(8),
                          color: Colors.amber,
                          child: Text("Matrix4.rotationX(0.5)"),
                        ),
                      ),
                    ),
                  ],
                ),

                Column(
                  children: [
                    Text("繞著Y軸(直向的軸)旋轉"),
                    Container(
                      color: Colors.grey,
                      child: Transform(
                        transform: Matrix4.rotationY(0.5),
                        child: Container(
                          padding: EdgeInsets.all(8),
                          color: Colors.amber,
                          child: Text("Matrix4.rotationY(0.5)"),
                        ),
                      ),
                    ),
                  ],
                ),

                Column(
                  children: [
                    Text("繞著Z軸(穿出螢幕的軸)旋轉"),
                    Container(
                      color: Colors.grey,
                      child: Transform(
                        transform: Matrix4.rotationZ(0.3),
                        child: Container(
                          padding: EdgeInsets.all(8),
                          color: Colors.amber,
                          child: Text("Matrix4.rotationZ(0.3)"),
                        ),
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
