import 'package:flutter/material.dart';
import 'package:flutter_app_client/page/index.dart';
import 'package:flutter_app_client/page/userManger/login/login.dart';

///页面路由映射表
class RouteMap {
  static final routes = <String, WidgetBuilder>{
    //主页菜单
    '/home': (BuildContext context) => const MainHomePage(),
    '/login': (BuildContext context) => LoginPage(),
  };
}
