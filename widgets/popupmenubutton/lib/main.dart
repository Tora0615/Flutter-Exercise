import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

//enum enum_name { enumeration list }
//enumeration list 由逗點隔開，第一個的 index 為 0
enum Items {One, Two, Three, Four}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("PopupMenuButton練習"),),
        body: Center(
          child: TextButton(
            onPressed: (){
            },
            child: PopupMenuButton<Items>(
              onSelected: (Items result){
                print(result);
              },
              itemBuilder: (BuildContext context){
                return [
                  PopupMenuItem(
                    child: Text("選項一"),
                    value: Items.One,
                  ),
                  PopupMenuItem(
                    child: Text("選項二"),
                    value: Items.Two,
                  ),
                  PopupMenuItem(
                    child: Text("選項三"),
                    value: Items.Three,
                  ),
                  PopupMenuItem(
                    child: Text("選項四"),
                    value: Items.Four,
                  ),
                ];
              },
            ),
          ),
        ),
      ),
    );
  }
}
