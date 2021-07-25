import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  int i = 0;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 1,
      ),
    );

    // controller 監聽 _update() 函數
    // 每當 animation 的值改變時，就會去 call 一次 listener
    _controller!.addListener(_update);
    _controller!.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    print("here");
    super.dispose();
  }

  // 每次 animation 的值改變時，此 function 就會被呼叫
  // 並且每次都會進行 setState
  void _update() {
    setState(() {
      i = (_controller!.value * 299792458).round(); //四捨五入
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            '$i m/s',
            style: TextStyle(
              fontSize: 32,
              color: Colors.amber,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: () {
            setState(() {
              // 把 controller 的值設回 0
              _controller!.value = 0;
              // 重新調用 controller，使其從頭開始
              _controller!.forward();
            });
          },
        ),
      ),
    );
  }
}
