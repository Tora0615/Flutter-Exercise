import 'package:flutter/material.dart';

void main() {
  runApp(DefaultTapControllerSample());
}

class DefaultTapControllerSample extends StatelessWidget {

  final List<Tab> myTabs = [
    Tab(text: "Tab1",),
    Tab(text: "Tab2",),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(  // Controller
          length: myTabs.length,
          child: Scaffold(
            appBar: AppBar(
              title: Text("This is APP Bar"),
              bottom: TabBar(  //AppBar 下呼叫 TabBar 建構子
                tabs: myTabs,  //每個 Tab 的文字 List
              ),
            ),
            body: TabBarView(  //每個 Tab 對應的頁面內容
              // children 要回傳 List
              children: myTabs.map((Tab tab) => Center(child: Text(tab.text!))).toList()
            ),
          ),
      ),
    );
  }
}
