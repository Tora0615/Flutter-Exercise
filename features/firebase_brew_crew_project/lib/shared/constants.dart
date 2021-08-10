import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  // 在輸入欄的提示文字
  // hintText: "請輸入 Email : ",
  // 之後使用 copy with 動態填入。

  // 輸入框要填滿的顏色
  fillColor: Colors.white60,
  // 是否輸入框要填滿顏色
  filled: true,
  // 一般情況下的邊框
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey,
      width: 2,
    ),
  ),
  // 輸入時的邊框
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.brown,
      width: 2,
    ),
  ),
);
