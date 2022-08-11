import 'package:flutter/material.dart';
import 'package:flutter_app_client/utils/sputils.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

mixin SplashMixin<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    super.initState();
    // ScreenUtil.init(
    //   context,
    //   designSize: const Size(360, 690), // 设计图尺寸
    // ); // 屏幕方向
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2500)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 25.0
      ..radius = 5.0
      ..backgroundColor = Colors.black87
      ..indicatorColor = Colors.white
      ..textColor = Colors.white
      ..progressColor = Colors.red
      ..userInteractions = false
      ..maskType = EasyLoadingMaskType.black
      ..errorWidget = Container()
      ..successWidget = Container()
      ..infoWidget = Container()
      ..userInteractions = false;
    countDown();
  }

  //倒计时
  void countDown() {
    var duration = const Duration(seconds: 2);
    Future.delayed(duration, goHomePage);
  }

  //页面跳转
  void goHomePage() {
    String? userinfo = SPUtils.getUserInfo();
    if (userinfo != null && userinfo != "") {
      Navigator.of(context).pushReplacementNamed('/home');
    } else {
      Navigator.of(context).pushReplacementNamed('/login');
    }
  }
}
