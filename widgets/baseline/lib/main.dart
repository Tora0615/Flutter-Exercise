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
          body: Column(
            children: [
              Text("Baseline 對齊",style: TextStyle(fontSize: 30),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Baseline(
                    baseline: 80,
                    baselineType: TextBaseline.alphabetic,
                    child: Text(
                      "AbcXyz",
                      style: TextStyle(
                        fontSize: 18,
                        textBaseline: TextBaseline.alphabetic,
                      ),
                    ),
                  ),

                  Baseline(
                    baseline: 80,
                    baselineType: TextBaseline.alphabetic,
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.amber,
                    ),
                  ),

                  Baseline(
                    baseline: 80,
                    baselineType: TextBaseline.alphabetic,
                    child: Text(
                      "GpAfagb",
                      style: TextStyle(
                        fontSize: 26,
                        textBaseline: TextBaseline.alphabetic,
                      ),
                    ),
                  )
                ],
              ),

              SizedBox(height: 40,),

              Text("一般情形",style: TextStyle(fontSize: 30),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "AbcXyz",
                    style: TextStyle(
                      fontSize: 18,
                      textBaseline: TextBaseline.alphabetic,
                    ),
                  ),

                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.amber,
                  ),

                  Text(
                    "GpAfagb",
                    style: TextStyle(
                      fontSize: 26,
                      textBaseline: TextBaseline.alphabetic,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
