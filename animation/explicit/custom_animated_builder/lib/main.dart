import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}


// 光束形狀的 Class
class BeamClipper extends CustomClipper<Path> {
  const BeamClipper();

  @override
  getClip(Size size) {
    return Path()
      ..lineTo(size.width / 2, size.height / 2)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(size.width / 2, size.height / 2)
      ..close();
  }

  /// Return false always because we always clip the same area.
  @override
  bool shouldReclip(CustomClipper oldClipper) => false;
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}


// mixin : SingleTickerProviderStateMixin
class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {

  // 初始化 AnimationController
  AnimationController? _animation;

  // widget init 設定 AnimationController
  @override
  void initState() {
    super.initState();
    _animation = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat();
    // 從 init 開始就一直 repeat
  }

  // widget 銷毀時動畫銷毀
  @override
  void dispose() {
    _animation!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: AlignmentDirectional.center,
          children: <Widget>[

            // widget 內呼叫 AnimatedBuilder
            AnimatedBuilder(
              animation: _animation!,
              builder: (context, snapshot) {
                // print(_animation!.value);  //觀看 animation!.value
                return ClipPath(
                  clipper: const BeamClipper(),
                  child: Container(
                    height: 1000,
                    decoration: BoxDecoration(

                      // 漸變 : 放射狀漸變
                      gradient: RadialGradient(
                        radius: 1.5,  //半徑範圍
                        colors: [
                          Colors.yellow,
                          Colors.transparent,
                        ],

                        // stops 數要對應 color 數
                        // 其數值為0~1，對應的為放射性漸變的範圍
                        // 例如 stops: [0, 0.25], 代表從 0 ~ 0.25 顯示漸變

                        // 此處 animation!.value 會動態從 0 ~ 1 改變
                        // 因此在會有動態漸變的動畫
                        stops: [0, _animation!.value],

                      ),
                    ),
                  ),
                );
              }
            ),

            // stack 中對齊用的 widget，為了使模擬的 UFO 放在合適位置
            Positioned(
              top: MediaQuery.of(context).size.height / 4,
              child: Container(
                height: 200,
                width: 200,
                color: Colors.grey,
                child: Center(
                  child: Text(
                    'UFO',
                    style: TextStyle(color: Colors.white, fontSize: 36),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
