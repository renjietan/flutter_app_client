import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_app_client/config/EnumSum.dart';

class SimpleNotify extends StatefulWidget {
  /// 提醒文本。
  final String text;

  /// 消息提醒类型
  final SimpleNotifyType type;

  /// 最小高度
  final double minHeight;

  /// 编剧
  final double paddingTop;
  const SimpleNotify({
    required this.text,
    this.type = SimpleNotifyType.success,
    this.minHeight = 0,
    this.paddingTop = 0,
  });

  @override
  State<SimpleNotify> createState() => _SimpleNotifyState();
}

class _SimpleNotifyState extends State<SimpleNotify> {
  final Map<SimpleNotifyType, Color> _colorList = {
    SimpleNotifyType.success: const Color(0xFF5AA6FD).withOpacity(0.2),
    SimpleNotifyType.warn: const Color.fromRGBO(230, 162, 60, 1),
    SimpleNotifyType.error: const Color.fromRGBO(245, 108, 108, 1),
    SimpleNotifyType.info: const Color.fromRGBO(144, 147, 153, 1),
  };
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  _startTimer() {
    _timer = Timer(
      const Duration(seconds: 2),
      () {
        Navigator.of(context).pop(true);
      },
    );
  }

  void _cancelTimer() {
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GestureDetector(
      onTap: () {
        _cancelTimer();
        Navigator.of(context).pop(true);
      },
      child: Column(
        children: <Widget>[
          SizedBox(
            height: widget.paddingTop,
          ),
          Container(
            width: double.infinity,
            // height: ScreenUtil().setHeight(40),
            constraints: BoxConstraints(
              minHeight: widget.minHeight,
            ),
            padding: EdgeInsets.symmetric(
              vertical: ScreenUtil().setWidth(10),
              horizontal: ScreenUtil().setWidth(10),
            ),
            alignment: Alignment.center,
            color: _colorList[widget.type],
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Material(
                color: Colors.transparent,
                child: Text(
                  widget.text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(12),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
