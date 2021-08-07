import 'package:flutter/material.dart';
import 'package:firebase_brew_crew_project/services/auth.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();

  // Text field temp saving
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0,
        title: Text("Brew Crew 帳號註冊"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),

        // 表單組件，可以對輸入框分組並進行統一操作。
        // 如輸入內容校驗、輸入框重置、輸入內容保存。
        // 可以統一操作只能是 FormField 類型。
        // 參考 : https://book.flutterchina.club/chapter3/input_and_form.html#_3-7-1-textfield
        child: Form(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: (val) {  // 每次文字改變(新增、刪除等)
                  email = val ;  // 影片有用 setState，但我覺得不用，目前可 print 出來
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                obscureText: true, // 輸入文字隱藏
                onChanged: (val) {  // 每次文字改變(新增、刪除等)
                  password = val ; // 影片有用 setState，但我覺得不用，目前可 print 出來
                },
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.brown[300],
                ),
                child: Text(
                  "註冊新帳號",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  print(email);
                  print(password);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
