import 'package:flutter/material.dart';

class EdgeGlowingButton extends StatelessWidget {
  final double width;
  final double height;
  final Color mainColor1;
  final Color mainColor2;
  final Color buttonBackgroundColor;
  final Function()? onTap;
  final Text textWidget;
  final double? outerBorderRadius;
  final double? innerBorderRadius;
  final double padding;
  final double? rotation;

  const EdgeGlowingButton({
    Key? key,
    required this.mainColor1,
    required this.mainColor2,
    required this.onTap,
    required this.textWidget,
    required this.padding,
    required this.buttonBackgroundColor,
    required this.height,
    required this.width,
    this.rotation,
    this.outerBorderRadius,
    this.innerBorderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(outerBorderRadius != null ? outerBorderRadius! : 0),  //整個組件最外層圓角，沒有的話改背景顏色會有白色的角
      child: InkWell(
        borderRadius: BorderRadius.circular(outerBorderRadius != null ? outerBorderRadius! : 0),  //水波紋圓角，沒有的話水波紋會是正方形
        onTap: onTap,
        // 用Ink代替Container，設置顏色與形狀
        // Container 若有設定顏色，會把 InkWell 水波紋吃掉
        child: Ink(  //外圈糜紅燈
          width: width,
          height: height,
          padding: EdgeInsets.all(padding),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(outerBorderRadius != null ? outerBorderRadius! : 0),
            gradient: LinearGradient(
              //begin: Alignment(-0.4,1),
              //end: Alignment(0.4,-1),
              colors: [mainColor1,Color(0xFF0E1538),mainColor2],
              transform: GradientRotation(rotation == null ? 0.79 : rotation!/57.2957),  //弧度
            ),
            // 光暈效果 (不理想)
            // boxShadow: [
            //   BoxShadow(
            //     color: color1.withOpacity(0.5),
            //     //color: color1,
            //     //spreadRadius: 1,
            //     blurRadius: 5,
            //     offset: Offset(-5,0),
            //   ),
            //   // BoxShadow(
            //   //   color: Color(0xFF0E1538),
            //   //   //spreadRadius: 1,
            //   //   blurRadius: 5,
            //   //   offset: Offset(-15,0),
            //   // ),
            //   // BoxShadow(
            //   //   color: Color(0xFF0E1538),
            //   //   //spreadRadius: 1,
            //   //   blurRadius: 5,
            //   // ),
            //   BoxShadow(
            //     color: color2.withOpacity(0.5),
            //     //spreadRadius: 1,
            //     blurRadius: 5,
            //     offset: Offset(5,0),
            //   ),
            // ],
          ),
          child: Ink(  //內圈
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(innerBorderRadius != null ? innerBorderRadius! : 0),
              color: buttonBackgroundColor,
            ),
            child: Container(
              child: Center(
                child: textWidget,
              ),
            ),
          ),
        ),
      ),
    );
  }
}