import 'package:flutter/material.dart';
import 'package:firebase_brew_crew_project/services/auth.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  const Register({Key? key, required this.toggleView}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
        title: Text("Brew Crew 帳號註冊"),
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
              "登入",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),

        // 表單組件，可以對輸入框分組並進行統一操作。
        // 如輸入內容校驗、輸入框重置、輸入內容保存。
        // 可以統一操作只能是 FormField 類型。
        // 參考 : https://book.flutterchina.club/chapter3/input_and_form.html#_3-7-1-textfield
        child: Form(
          // 將 _formKey 與此 Form 做關聯。
          // 為其他 TextFormField 的 global key
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              TextFormField(  // email 的 TextFormField
                onChanged: (val) {
                  // 每次文字改變(新增、刪除等)
                  email = val; // 影片有用 setState，但我覺得不用，目前可 print 出來
                },

                // validator 會回傳字串(輸入有問題)或null(輸入沒問題)，
                // 此字串是會在螢幕上顯示的幫助文字。
                validator: (val) {
                  if (val!.isEmpty) {
                    return "請輸入 Email";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(  // 密碼的的 TextFormField
                obscureText: true, // 輸入文字隱藏
                onChanged: (val) {
                  // 每次文字改變(新增、刪除等)
                  password = val; // 影片有用 setState，但我覺得不用，目前可 print 出來
                },

                // validator 會回傳字串(輸入有問題)或null(輸入沒問題)，
                validator: (val) {
                  if (val!.length < 6) {
                    return "請輸入至少六位數的密碼";
                  } else {
                    return null;
                  }
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
                  // 會在按下按鈕時，呼叫 _formKey.currentState!.validate() 時
                  // 其會去呼叫 TextFormField 中 validator 內的函式，
                  // 去檢查輸入內容是否符合標準。若都正常(回傳null)，
                  // _formKey.currentState!.validate() 最終會返回 true。
                  // true 代表格式 OK，之後就會執行裡面的內容。
                  if (_formKey.currentState!.validate()) {
                    // print(email); // 測試用
                    // print(password);
                    dynamic result = await _auth.registerWithEmailAndPassword(
                      email: email,
                      password: password,
                    );

                    // 註冊失敗
                    if (result == null) {
                      setState(() {
                        error = "請輸入正常可用的 email";
                      });
                    }
                    // 若註冊成功 -> 會自動登入並顯示 home page
                    // 這是在 wrapper 那寫好的邏輯
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
