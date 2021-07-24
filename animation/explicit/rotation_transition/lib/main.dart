import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}


// 顯式動畫要包在 StateFul widget 中，並且要利用 with 混合(mixin) SingleTickerProviderStateMixin。(重要)
class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {

  // 顯式動畫最不一樣的點是要自行控制 AnimationController
  AnimationController? _animationController;


  // 在 initState 時，要為 AnimationController 設定 duration 及 vsync
  @override
  void initState() {
    _animationController = AnimationController(
      duration: Duration(seconds: 5),

      // vsync 為 TickerProvider 類型的參數，
      // 但因為 StateFul widget 有 mixin SingleTickerProviderStateMixin，
      // 因此在此處用 this 填入就好。
      vsync: this,
    );
    super.initState();

    // 在 initState 此處可以預先設定 Animation 設定完成後直接執行，只需呼叫.repeat()就好。
    // 範例如下 : _animationController!.repeat();

    // 亦可在創立當下尾部加入..repeat()
    // 寫法如下 : _animationController = AnimationController( /*略*/ )..repeat();
  }

  // 顯式動畫重要的點之一，就是要自行控制 AnimationController 的銷毀
  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Center(

            // 在此呼叫內建顯式動畫 widget : RotationTransition。
            // 其有三大必要建構子 : child，alignment，turns
            child: RotationTransition(
              child: Container(
                width: 200,
                height: 200,
                color: Colors.amber,
              ),
              alignment: Alignment.center,  //對齊

              //此處turns為Animation<double>型態，傳入 AnimationController 即可
              turns: _animationController!,
            ),
          ),

          // 按鈕控制動畫暫停或繼續
          floatingActionButton: FloatingActionButton(
            child: Icon(
              Icons.rotate_right,
            ),
            onPressed: (){
              if (_animationController!.isAnimating) {  //如果動畫正在撥放
                _animationController!.stop();  // 動畫停止
              } else {
                _animationController!.repeat();  //動畫繼續
              }
            },
          ),
        ),
      ),
    );
  }
}
