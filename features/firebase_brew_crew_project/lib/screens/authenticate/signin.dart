import 'package:firebase_brew_crew_project/services/auth.dart';
import 'package:flutter/material.dart';
import '../../shared/constants.dart';

class SignIn extends StatefulWidget {

  final Function toggleView ;

  const SignIn({Key? key,required this.toggleView}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();

  // 用來持續追蹤此 form 與他的狀態。
  // 未來如果嘗試驗證 form 的內容，就可以經由此 form key 達成。
  // 因為利用此 key 就能訪問資料與狀態。
  final _formKey = GlobalKey<FormState>();

  // Text field temp saving
  String email = "";
  String password = "";

  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0,
        title: Text("Brew Crew 登入"),

        // appbar 按鈕
        actions: [
          TextButton.icon(
            onPressed: () {
              widget.toggleView();
            },
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            label: Text(
              "註冊",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),

        // 表單組件，可以對輸入框分組並進行統一操作。
        // 如輸入內容校驗、輸入框重置、輸入內容保存。
        // 可以被統一操作的只能是 FormField 類型。
        // 參考 : https://book.flutterchina.club/chapter3/input_and_form.html#_3-7-1-textfield
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: textInputDecoration.copyWith(
                hintText: "請輸入 Email ",
              ),
                validator: (val) {
                  if (val!.isEmpty) {
                    return "請輸入 Email";
                  } else {
                    return null;
                  }
                },
                onChanged: (val) {
                  // 每次文字改變(新增、刪除等)
                  email = val; // 影片有用 setState，但我覺得不用，目前可 print 出來
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                obscureText: true, // 輸入文字隱藏
                decoration: textInputDecoration.copyWith(
                  hintText: "請輸入至少六位數的密碼",
                ),
                validator: (val) {
                  if (val!.length < 6) {
                    return "請輸入至少六位數的密碼";
                  } else {
                    return null;
                  }
                },
                onChanged: (val) {
                  // 每次文字改變(新增、刪除等)
                  password = val; // 影片有用 setState，但我覺得不用，目前可 print 出來
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
                  "登入",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {

                    //print("validate");
                    dynamic result = await _auth.signInWithEmailAndPassword(
                      email: email,
                      password: password,
                    );

                    // 失敗
                    if (result == null) {
                      setState(() {
                        error = "帳號或密碼錯誤";
                      });
                    }
                  }
                },
              ),
              SizedBox(
                height: 12,
              ),
              Text( // 顯示錯誤訊息
                error,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 匿名登入按鈕 (封存用)
/*

ElevatedButton(
  child: Text("Sign in anonymous"),
  onPressed: () async{
    dynamic result = await _auth.signInAnon();     // 可能回傳 user or null
    if(result == null){
      print("Singing in error");
    }else{
      print("signed in");
      print(result.uid);  // 原本 print(result);
    }
  },
),

*/
