import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  // firebase auth object
  final FirebaseAuth _auth = FirebaseAuth.instance; //private object
  // 可以利用 _auth 操作 FirebaseAuth 這個 class 裡不同屬性跟功能

  // sign in anon (anonymous)
  // 是個非同步事件，並且會回傳 Future
  Future signInAnon() async {
    // 嘗試登入
    try{
      UserCredential result = await _auth.signInAnonymously();  // 與影片不同
      User? user = result.user;  // 與影片不同
      return user;
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  // sign in with email and password

  // register with email and password

  // sign out
}
