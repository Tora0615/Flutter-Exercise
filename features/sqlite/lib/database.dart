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
      onOpen: (db){},
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

    // rawQuery 是直接用 SQL 語句查詢
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM Client");

    // table.first["id"] 一開始是 null
    int id = table.first["id"] == null ? 0 : table.first["id"] as int;

    var raw = await db.rawInsert(
        "INSERT Into Client (id,name,age,sex)"
        "VALUES (?,?,?,?)",
        [id, newClient.name, newClient.age, newClient.sex]);

    print("raw" + raw.toString());
    return raw;
  }

  updateSex(Client client) async {
    final db = await database;
    Client tempClient = Client(
      id: client.id,
      name: client.name,
      age: client.age,
      sex: !client.sex!, //反轉性別
    );
    var res = await db.update("Client", tempClient.toMap(),
        where: "id = ?", whereArgs: [client.id]);
    return res;
  }

  updateClient (Client newClient) async {
    final db = await database;
    var res = await db.update("Client", newClient.toMap(),
        where: "id = ?", whereArgs: [newClient.id]);
    return res;
  }
  
  getClient(int id) async {
    final db = await database;
    var res = await db.query("Client", where: "id = ?",whereArgs: [id] );
    return res.isNotEmpty ? Client.fromMap(res.first) : null ;
  }

  Future<List<Client>> getAllClients() async {
    final db = await database;
    var res = await db.query("Client");

    // 將 res 這可迭代的東東，利用.map，經內部function逐一轉換處理，
    // 再把迭代處理完這坨利用.toList()轉型成List
    List<Client> list = res.isNotEmpty ? res.map((e) => Client.fromMap(e)).toList() : [] ;
    return list;
  }

  deleteClient(int id) async{
    final db = await database;
    return db.delete("Client", where: "id = ?", whereArgs: [id]);
  }

  deleteAll() async{
    final db = await database;
    db.rawDelete("Delete * from Client");
  }

}

// 參考
// SQLiteDatabase query 和 rawQuery 的区别
// https://blog.csdn.net/chaoyu168/article/details/50350392