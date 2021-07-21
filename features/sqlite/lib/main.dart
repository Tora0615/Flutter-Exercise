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
      body: FutureBuilder<List<Client>>(
        future: DBProvider.db.getAllClients(),
        builder: (BuildContext context, AsyncSnapshot<List<Client>> snapshot){
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                Client item = snapshot.data![index];
                return Dismissible(
                  key: UniqueKey(),
                  background: Container(
                    color: Colors.red,
                  ),
                  onDismissed: (direction) {
                    DBProvider.db.deleteClient(item.id!);
                  },
                  child: ListTile(
                    title: Text(item.name.toString()),
                    leading: Text(item.id.toString()),
                    trailing: Checkbox(
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
          Client rnd = clients [math.Random().nextInt(clients.length)];
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
