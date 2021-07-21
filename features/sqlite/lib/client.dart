import 'package:flutter/foundation.dart';

class Client{
  int? id;
  String? name;
  int? age;
  bool? sex;

  Client({this.name,this.age,this.id,this.sex});

  // 將 Json 轉成數據模型
  factory Client.fromMap( Map <String, dynamic> json ){ //似乎是名為json的 string : 動態變數 的形式(map)
    return Client(
      id : json["id"],
      name : json["name"],
      age: json["age"],
      sex: json["sex"] == 1,
    );
  }

  // 將數據模型轉成 Json
  Map <String, dynamic> toMap() {
    return {  //回傳一坨 Map 數據
      "id" : id,
      "name" : name,
      "age" : age,
      "sex" : sex,
    };
  }

}