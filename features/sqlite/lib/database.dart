import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
//import 'client.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  // 私有構造函數
  DBProvider._();

  // 單例模式 (唯一產生的物件)
  static final DBProvider db = DBProvider._();

  // 私有 database 變數，後續呼叫要加底線
  Database? _database; //多加了 ? (null safety)

  // 獲取 database
  Future<Database> get database async {
    if (_database != null) {
      // db 存在就 return
      return _database!; //多加了 ! (null safety)
    } else {
      // db 不存在就呼叫 initDB 創造，再return
      _database = await initDB();
      return _database!; //多加了 ! (null safety)
    }
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "client.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Client ("
          "id INTERGER PRIMARY KEY,"
          "name TEXT,"
          "age INTERGER,"
          "sex BIT"
          ")");
    });
  }

  insertClient (Client newClient) async {
    final db = await database;
  }
}
