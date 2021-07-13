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
                        child: Text("文字文字")
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
                          child: Text("文字文字")
                      ),
                    ),
                    Text("BoxFit.fill"),
                    Text("說明 : 無視寬高比，盡\n量填滿，不超出範圍")
                  ],
                ),


              ],
            ),

            SizedBox(height: 50,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                // BoxFit.contain
                Column(
                  children: [
                    Container(
                      color: Colors.amber,
                      width: 100,
                      height: 100,
                      child: FittedBox(
                          fit: BoxFit.contain,
                          alignment: Alignment.topLeft,
                          child: Text("文字文字")
                      ),
                    ),
                    Text("BoxFit.contain"),
                    Text("說明 : 等比填充\n，不超出範圍")
                  ],
                ),

                //BoxFit.cover
                Column(
                  children: [
                    Container(
                      color: Colors.amber,
                      width: 100,
                      height: 100,
                      child: FittedBox(
                          fit: BoxFit.cover,
                          alignment: Alignment.topLeft,
                          child: Text("文字文字")
                      ),
                    ),
                    Text("BoxFit.cover"),
                    Text("說明 : 等比填充，填滿\n空間，可能會超出範圍")
                  ],
                ),


              ],
            ),

            SizedBox(height: 50,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                // BoxFit.contain
                Column(
                  children: [
                    Container(
                      color: Colors.amber,
                      width: 100,
                      height: 100,
                      child: FittedBox(
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.topLeft,
                          child: Text("文字文字")
                      ),
                    ),
                    Text("BoxFit.fitWidth"),
                    Text("說明 : \n等比填滿寬度，\n寬不超出範圍，\n另一側可能超出")
                  ],
                ),

                //BoxFit.cover
                Column(
                  children: [
                    Container(
                      color: Colors.amber,
                      width: 100,
                      height: 100,
                      child: FittedBox(
                          fit: BoxFit.fitHeight,
                          alignment: Alignment.topLeft,
                          child: Text("文字文字")
                      ),
                    ),
                    Text("BoxFit.fitHeight"),
                    Text("說明 : \n等比填滿高度，\n高不超出範圍，\n另一側可能超出")
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
