import 'package:flutter/foundation.dart';

class Client{
  int? id;
  String? name;
  int? age;
  bool? sex;

  Client({this.name,this.age,this.id,this.sex});

  // 將 Map 形式轉成 Client 數據型式並回傳
  factory Client.fromMap( Map <String, dynamic> json ){ //名為 json 的 map 形式(string : 動態變數)
    return Client(
      id : json["id"],
      name : json["name"],
      age: json["age"],
      sex: json["sex"] == 1,  // sqlite 不能存 bool，因此用回來的 bit 變數比對，看是 true 還是 false。 (設 1 為男)
    );
  }

  // 將數據模型轉成 Map 形式 (DB處理會用到)
  Map <String, dynamic> toMap() {
    return {  //回傳一坨 Map 數據
      "id" : id,
      "name" : name,
      "age" : age,
      "sex" : sex! ? 1 : 0,  // sqlite 不能存 bool，因此用 true 還是 false，轉換為 bit 的 0 or 1。 (設 1 為男)
    };
  }

}