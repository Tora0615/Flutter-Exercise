import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'client.dart';
import 'database.dart';

void main() {
  runApp(MaterialApp(home : MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // floatingActionButton 的模板
  List<Client> clients = [
    Client(name: "張三", age: 20, sex: false),
    Client(name: "李四", age: 22, sex: true),
    Client(name: "王五", age: 28, sex: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("sqflite 範例"),
      ),

      // FutureBuilder : 確認未來會有資料回來，再渲染的 widget builder
      body: FutureBuilder<List<Client>>(

        // 取得所有Client
        future: DBProvider.db.getAllClients(),
        builder: (BuildContext context, AsyncSnapshot<List<Client>> snapshot){

          // 有拿到資料
          if (snapshot.hasData) {
            return ListView.builder(

              // 資料個數
              itemCount: snapshot.data!.length,
              // 依資料個數 return 對應數量 widget 的 builder
              itemBuilder: (BuildContext context, int index) {
                // 當下某個的 Client 資料
                Client item = snapshot.data![index];
                // Dismissible 是可以滑動刪除的widget
                return Dismissible(
                  key: UniqueKey(),
                  background: Container(
                    color: Colors.red,
                  ),
                  onDismissed: (direction) {
                    DBProvider.db.deleteClient(item.id!);
                  },
                  // 每比實際資料的顯現
                  child: ListTile(
                    title: Text(item.name.toString()),
                    leading: Text(item.id.toString()),
                    trailing: Checkbox(
                      // 切換性別
                      onChanged: (bool? value) {
                        DBProvider.db.updateSex(item);
                        setState(() {});
                      },
                      value: item.sex,
                    ),
                  ),
                );
              },
            );
          }

          // 沒拿到資料，預設顯示轉圈圈的緩衝動畫
          else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          // 從模板 clients 中隨機抽取一個 Client Object
          Client rnd = clients [math.Random().nextInt(clients.length)];
          // 插入 database 中
          await DBProvider.db.insertClient(rnd);
          setState(() {

          });
        },
      ),

    );
  }
}

// 參考
// Flutter|深入理解BuildContext
// https://codertw.com/%E7%A8%8B%E5%BC%8F%E8%AA%9E%E8%A8%80/643893/#outline__1_0_1
