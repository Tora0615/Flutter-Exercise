import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: LayoutDemo(),
    )
  );
}

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Drawer 範例"),),
      // 左側出現的drawer
      drawer: Drawer(
        child: ListView(
          children: [
            // Drawer 中籃底區域
            UserAccountsDrawerHeader(
              accountName: Text("這是帳號欄 (accountName建構子) "),
              accountEmail: Text("這是Email欄 (accountEmail建構子)"),

              //左上帳號圖片
              currentAccountPicture:  CircleAvatar(
                backgroundImage: AssetImage("senko.png"),
              ),

              //帳號&Email欄，按了小箭頭會動
              onDetailsPressed: (){
                print("detail pressed");
              },

              // 右上角其他帳號的圖
              otherAccountsPictures: [
                Container(
                  child: Image.asset("senko2.png"),
                ),
              ],
            ),

            //下方可滑動的列表
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.color_lens),),
              title: Text("個性裝扮"),
            ),

          ],
        ),
      ),
    );
  }
}
