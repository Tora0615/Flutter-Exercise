# edge_glowing_button


### 參考資料
* flutter中使用InkWell给任意Widget添加点击事件
    * https://blog.csdn.net/zl18603543572/article/details/95037826

* Flutter 之 水波纹Ripple
    * https://zhuanlan.zhihu.com/p/38427414



### 筆記
* InWell 可以在 widget 上添加點擊事件，並顯示水波紋。

* Ink widget 可以用來設置顏色、形狀、大小等，跟container非常類似。

* InWell 沒有水波紋 ?
    * 若內部 Container 有添加顏色的參數(無論是直接設定 color ，或是在 decoration: BoxDecoration() 中設定)，水波紋就會被蓋掉。
    * 可以把 Container 用 Ink widget代替，並用他設定顏色、形狀、大小。

* Inkwell 水波紋形狀是正方形的 ?
    * 記得要在 InkWell widget 內設定 borderRadius。


### simple example

```
Container(
  color: Color(0xFF0E1538),
  child: Center(
    child: EdgeGlowingButton(
      mainColor1: Colors.purpleAccent,
      mainColor2: Colors.indigoAccent,
      buttonBackgroundColor: Color(0xFF0E1538),
      onTap: (){
        print("tap");
      },
      textWidget: Text(
        "Button",
        style: TextStyle(
          color: Colors.white,
          fontSize: 26,
        ),
      ),
      outerBorderRadius: 10,
      innerBorderRadius: 7,
      width: 210,
      height: 90,
      padding: 3,
      rotation: 30, //degree
    ),
  ),
),
```