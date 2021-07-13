import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                // BoxFit.none
                Column(
                  children: [
                    Container(
                      color: Colors.amber,
                      width: 100,
                      height: 100,
                      child: FittedBox(
                        fit: BoxFit.none,
                        alignment: Alignment.topLeft,
                        child: Text("文字文字文字")
                      ),
                    ),
                    Text("BoxFit.none"),
                    Text("說明 : 無填充")
                  ],
                ),

                //BoxFit.fill
                Column(
                  children: [
                    Container(
                      color: Colors.amber,
                      width: 100,
                      height: 100,
                      child: FittedBox(
                          fit: BoxFit.fill,
                          alignment: Alignment.topLeft,
                          child: Text("文字文字文字")
                      ),
                    ),
                    Text("BoxFit.fill"),
                    Text("說明 : 不管寬高比，盡\n量填滿，不超出範圍")
                  ],
                ),


              ],
            ),
          ],
        ),
      ),
    );
  }
}
