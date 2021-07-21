import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'client.dart';
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

  //初始化資料庫
  initDB() async {
    //獲取文檔目錄對象 (Android : data/data/<package_name>/database. iOS : Document 目錄 )
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    // 路徑變數的整合
    // 例子 : p.join('path', 'to', 'foo');  -> 'path/to/foo'
    String path = join(documentsDirectory.path, "client.db");

    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        // 創一個名為 Client 的 DB
        await db.execute("CREATE TABLE Client ("
            "id INTERGER PRIMARY KEY,"
            "name TEXT,"
            "age INTERGER,"
            "sex BIT"
            ")");
      },
    );
  }

  //新增Client
  insertClient(Client newClient) async {
    final db = await database;
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM Client");
    int id = table.first["id"];

    var raw = await db.rawInsert(
      "INSERT Into Client (id,name,age,sex)"
      "VALUES (?,?,?,?)",
      [id, newClient.name, newClient.age, newClient.sex]
    );

    print ("raw" + raw.toString());
    return raw;
  }
}
