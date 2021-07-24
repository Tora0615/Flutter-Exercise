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



class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    );
    super.initState();
  }

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
            child: RotationTransition(
              child: Container(
                width: 200,
                height: 200,
                color: Colors.amber,
              ),
              alignment: Alignment.center,
              turns: _animationController!,
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(
              Icons.rotate_right,
            ),
            onPressed: (){
              if (_animationController!.isAnimating) {
                _animationController!.stop();
              } else {
                _animationController!.repeat();
              }
            },
          ),
        ),
      ),
    );
  }
}
