import 'package:flutter/material.dart';

void main() => runApp(HeroApp());

class HeroApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transition Demo',
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: Column(
        children: [

          // 圖片練習
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen();
              }));
            },
            child: Hero(
              tag: 'imageHero',
              child: Image.network(
                'https://picsum.photos/250?image=9',
                scale: 2,
              ),
            ),
          ),

          SizedBox(
            height: 100,
          ),

          // container
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return ContainerScreen();
              }));
            },
            child: Hero(
              tag: 'Container',
              child: Container(
                color: Colors.amber,
                child: SizedBox(
                  height: 125,
                  width: 125,
                ),
              )
            ),
          ),

        ],
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          // Hero 要包裹相同組件，且tag相同，切換時會自然地過渡過去
          child: Hero(
            tag: 'imageHero',
            child: Image.network(
              'https://picsum.photos/250?image=9',
            ),
          ),
        ),
      ),
    );
  }
}

class ContainerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          // Hero 要包裹相同組件，且tag相同，切換時會自然地過渡過去
          child: Hero(
            tag: 'Container',
            child: Container(
              color:Colors.red,
              child: SizedBox(
                height: 300,
                width: 300,
              ),
            )
          ),
        ),
      ),
    );
  }
}