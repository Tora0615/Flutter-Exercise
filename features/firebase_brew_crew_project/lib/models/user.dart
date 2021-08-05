// 因為新改版的 firebase user class 直接叫 User，為了不衝突，
// 更改此class 為 CustomUser。(與影片不同)
class CustomUser{
  final String uid;
  CustomUser({required this.uid});  // 建構子
}