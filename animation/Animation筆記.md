Flutter 動畫
===

# 在學習之前...

## 確認動畫形式 : 
* Drawing-based animations
    * 像是遊戲角色的sprite 
    * 用code難以達成的動畫
        * 像是圓圈轉一圈完成打個勾

        ![](https://i.imgur.com/sv1LRUO.png)
    * 建議使用 Rive、Lottie 或其他第三方工具
    * 不在此次討論中
* Code-based animations
    * widget 相關的動畫


## Code-based animations
* 隱式 (implicit) 動畫
    * 簡單易用
    * 不需複雜設定
* 顯式 (explicit) 動畫
    * 複雜
    * 需 animation controller
        * 需自行管理其 life cycle

## 三個問題選擇要用顯示/隱式動畫 : 
* 是否此動畫需要永遠重複 ? 
    * 如音樂撥放
* 其是否為不連續的動畫 ?
    * 例如圓圈擴散動畫
        * 他會重複的從小到大、從小到大，而不是小到大，然後再縮回去到小 
* 是否有多個 widget 要同時撥放動畫 ? 
    * 例如 : 

    ![](https://i.imgur.com/yJGjLEk.png)
* 若以上三者任何一個為 **是**，則需要用**顯式動畫**

## Code-based animations 決策樹
* 隱式動畫
    * 最先推薦使用 **內建隱式動畫**
    * 若內建隱式動畫無法滿足需求，則推薦 **客製化隱式動畫**
        * 如 [TweenAnimationBuilder](https://www.youtube.com/watch?v=l9uHB8VXZOg&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=66&ab_channel=Flutter)
* 顯式動畫
    * 隱式動畫無法滿足需求，則嘗試 **內建顯式動畫**
    * 若內建顯式動畫仍無法達成，則嘗試 **客製化顯式動畫**
        * 若要是用作 **獨立的 widget**
            * Class 撰寫時 Extend [AnimatedWidget](https://www.youtube.com/watch?v=LKKgYpC-EPQ&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=81&ab_channel=Flutter)
        * 若要是用在 **其他 widget 中的一小部分**
            * 用 [AnimatedBuilder](https://www.youtube.com/watch?v=N-RiyZlv8v8&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=29&ab_channel=Flutter)
    * 若顯式動畫有效能問題，可使用 **CustomPainter**
        * 會直接在 Canvas 上渲染，而不會遵循標準 widget build 規範
        * 沒寫好會有更嚴重的效能問題，謹慎使用

![](https://flutter.cn/assets/ui/animations/animation-decision-tree-cf57f0d6c1b6fd8e7ea512bd659c2f97a2f142f1137e89d1f67a5fbc1be9f2c3.png)


# 隱式(implicit)動畫介紹

什麼是 Flutter 中的隱式動畫 ? Flutter 提供許多簡易的動畫widget，可達成 widget 間的大小切換、顏色的漸變等。這些就是隱式動畫。

但這些提供的動畫 widget 有著一些缺點，作用時間只有開始到結束、可調參數少、無法重複、且無法倒轉動畫，這些就要在後續顯式動畫部分自定。

以下為隱式動畫的介紹 : 

## 內建隱式動畫
### AnimatedSwitcher - 用於 widget 間切換 

```java=

```

[AnimatedSwitcher(Flutter Widget of the Week)](https://www.youtube.com/watch?v=2W7POjFb88g&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=45&ab_channel=Flutter)

### AnimatedIcon - 有動畫的 Icon

```java=

```

[AnimatedIcon (Flutter Widget of the Week)](https://www.youtube.com/watch?v=pJcbh8pbvJs&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=39&ab_channel=Flutter)


### AnimatedList - List 若有資料增減，會有動畫過度

```java=

```

[AnimatedList (Flutter Widget of the Week)](https://www.youtube.com/watch?v=ZtfItHwFlZ8&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=34&t=42s&ab_channel=Flutter)


### AnimatedContainer - 帶動畫的 Container

```java=

```

[AnimatedContainer (Flutter Widget of the Week)](https://www.youtube.com/watch?v=yI-8QHpGIP4&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=6&ab_channel=GoogleDevelopers)


### AnimatedPositioned - 在 stack 中 widget 位置、大小的變換動畫

```java=

```


[AnimatedPositioned (Flutter Widget of the Week)](https://www.youtube.com/watch?v=hC3s2YdtWt8&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=46&ab_channel=Flutter)


### AnimatedCrossFade - widget 切換淡入淡出效果

```java=

```

[AnimatedCrossFade (Flutter Widget of the Week)](https://www.youtube.com/watch?v=PGK2UUAyE54&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=61&ab_channel=Flutter)


### AnimatedPadding - 動態轉換 padding

```java=

```

[AnimatedPadding (Flutter Widget of the Week)](https://www.youtube.com/watch?v=PY2m0fhGNz4&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=48)


### 補充資料 
1. Curves class 提供各式0~1間不同數值曲線，可改變動畫呈現方式
[參考資料 : Curves class](https://api.flutter.dev/flutter/animation/Curves-class.html)
2. [Flutter變換動畫](https://codertw.com/%E7%A8%8B%E5%BC%8F%E8%AA%9E%E8%A8%80/715419/#outline__1)
3. Flutter 二十五種動畫組件集合
    * AnimatedBuilder
    * AlignTransition
    * AnimatedOpacity
    * AnimatedAlign
    * AnimatedPadding
    * AnimatedCrossFade
    * AnimatedContainer
    * AnimatedPositioned
    * AnimatedPositionedDirectional
    * AnimatedSwitcher
    * AnimatedIcon
    * TweenAnimationBuilder
    * DecoratedBoxTransition
    * DefaultTextStyleTransition
    * AnimatedDefaultTextStyle
    * PositionedTransition
    * RelativePositionedTransition
    * RotationTransition
    * ScaleTransition
    * SizeTransition
    * SlideTransition
    * FadeTransition
    * AnimatedModalBarrier
    * AnimatedList
    * Hero

## 隱式動畫進階 - TweenAnimationBuilder
[Creating your own Custom Implicit Animations with TweenAnimationBuilder](https://youtu.be/6KiPEqzJIKQ)

# 顯式動畫
## 內建顯式動畫

### 內建顯式動畫列表如下 : 
![](https://i.imgur.com/HW2rpUN.png)

### 範例 : RotationTransition - 控制旋轉的顯式動畫

有幾個重要的點需要注意
1. 要搭配 StatefulWidget 使用，並且要 mixin 類別 SingleTickerProviderStateMixin
2. 在 StatefulWidget 中，要自行創建 AnimationController
3. AnimationController 要自行控制初始化與銷毀
    1. 初始化是在 initState() 中設定
        1. 可在初始化中設定動畫是否創建後就開始
        2. 創建後就開始可呼叫 _animationController.repeat()
    2. 銷毀是在 dispose() 中設定
        1. 需呼叫 _animationController.dispose();
4. AnimationController 的初始化有兩個必要參數
    1. duration 
    2. vsync
5. 可利用_animationController.isAnimating判斷動畫是否在執行，並且可利用按鈕控制動畫的停止或繼續
    1. 動畫的停止可呼叫 : _animationController.stop()
    2. 動畫的繼續可呼叫 : _animationController.repeat()


```java=
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

```

### 參考資料
[Making Your First Directional Animations with Built-in Explicit Animations](https://www.youtube.com/watch?v=CunyH6unILQ&list=PLjxrf2q8roU2v6UqYlt_KPaXlnjbYySua&index=4&ab_channel=Flutter)