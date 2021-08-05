import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_brew_crew_project/models/user.dart';

class AuthService {
  // firebase auth object
  final FirebaseAuth _auth = FirebaseAuth.instance; //private object
  // 可以利用 _auth 操作 FirebaseAuth 這個 class 裡不同屬性跟功能

  // a function create user obj based on firebase user class
  CustomUser? _userFormFirebaseUser(User? user) {
    //
    return user != null ? CustomUser(uid: user.uid) : null;
  }
  // 輸入值 User? user : 因為可能傳 null 進來，因此要加 "?" 。
  // 回傳值 CustomUser? : 因為可能回傳 null ，因此要加 "?" 。

  // auth change user stream
  Stream<CustomUser?> get user {  // 這是 class 使用 getter，可以在外部直接這樣呼叫 : AuthService.user。相關用法有 setter
    return _auth
        .authStateChanges()  // 與影片不同，舊的是 onAuthStateChange()
        .map(_userFormFirebaseUser); // 等同於 .map((User? user) => _userFormFirebaseUser(user));  每次將 User 映射到 CustomUser
  }

  // sign in anon (anonymous)
  Future signInAnon() async {
    // 是個非同步事件，並且會回傳 Future
    try {
      //嘗試登入
      // 呼叫匿名登入的 function
      UserCredential result = await _auth.signInAnonymously();

      //從 result 中取出 user
      User? user = result.user;
      return _userFormFirebaseUser(user); // 原本是 return user;
    } catch (e) {
      //登入失敗
      print(e.toString());
      return null;
    }
  }

  // sign in with email and password

  // register with email and password

  // sign out
}
