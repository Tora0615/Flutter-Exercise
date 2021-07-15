import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  List <String> items = List <String> .generate(30, (i) => "第${i+1}項");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index){
              final item = items[index];
              return Dismissible(
                  key: Key(item),
                  onDismissed: (direction){
                    items.removeAt(index);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('$item 被刪除了'),
                      ),
                    );
                  },
                  child: ListTile(
                    title: Text("$item"),
                  ),
              );
            },
          ),
        ),
      ),
    );
  }
}

