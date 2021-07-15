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
          body: Wrap(
            spacing: 8,
            runSpacing: 4,
            children: [
              Chips(cav: "西門", cla: "西門吹雪",),
              Chips(cav: "司空", cla: "司空摘星",),
              Chips(cav: "婉清", cla: "木婉清",),
              Chips(cav: "一郎", cla: "蕭十一郎",),
            ],
          ),
        ),
      ),
    );
  }
}



// ignore: must_be_immutable
class Chips extends StatelessWidget {

  String? cla;
  String? cav;
  Chips ({Key? key, required this.cav, required this.cla}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: CircleAvatar(
        backgroundColor: Colors.amber,
        child: Text(cav!,style: TextStyle(fontSize: 10),),
      ),
      label: Text(cla!),
    );
  }
}
