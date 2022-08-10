import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CounterConfig {
  static const double btnWidth = 20;
  static const double btnHeight = 20;
  static const Color btnColor = Color.fromRGBO(62, 103, 255, 1);
  static const double btnFontSize = 12;
  static const Color btnTextColor = Colors.white;
  static const Color background = Colors.transparent;
  static const double width = 100;
  static final TextStyle textStyle = TextStyle(
    fontSize: ScreenUtil().setSp(12),
    color: Colors.black,
  );
}
