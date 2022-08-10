import 'package:flutter/material.dart';

class BaseConfig {
  BaseConfig._init();
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  static final List<String> whiteList = ["/auth/login", "/submit"];
  static String baseUrl = "http://rap2api.taobao.org/app/mock/279150";
}
