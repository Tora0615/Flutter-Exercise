import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyPage(),
      theme: ThemeData.light(),
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {

    // Tab Bar 外必用的 scaffold
    return CupertinoTabScaffold(

      //必備
      tabBar: CupertinoTabBar(

        // BottomNavigationBarItem 的 List
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: "主頁 (BottomNavigationBarItem之一)", //flutter 2.0 改成這樣
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.conversation_bubble),
            label: "聊天 (BottomNavigationBarItem之一)", //flutter 2.0 改成這樣
          ),
        ],
      ),


      //用以回傳對應 index 的頁面
      tabBuilder: (context, index){
        return CupertinoTabView(
          builder: (context){
            switch (index){
              case 0:
                return HomePage();
              case 1:
                return ChatPage();
              default:
                return Container();
            }
          }
        );
      }
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // 頁面布局用 CupertinoPageScaffold
    return CupertinoPageScaffold(

      // 上面那條，似 AppBar
      navigationBar: CupertinoNavigationBar(
        middle: Text("主頁 (CupertinoNavigationBar : 類似AppBar)"),
      ),
      child: Center(
        child: Text("主頁 (頁面內容)",
          style: Theme.of(context).textTheme.button,
        ),
      )
    );
  }
}


class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // 頁面布局用 CupertinoPageScaffold
    return CupertinoPageScaffold(

        // 上面那條，似 AppBar
        navigationBar: CupertinoNavigationBar(
          middle: Text("聊天面板 (CupertinoNavigationBar : 類似AppBar)"),
        ),
        child: Center(
          child: Text("聊天面板 (頁面內容)",
            style: Theme.of(context).textTheme.button,
          ),
        )
    );
  }
}

