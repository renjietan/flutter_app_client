import 'dart:convert';
import 'dart:isolate';

import 'package:dio/dio.dart';
import 'package:flutter_app_client/config/baseConfig.dart';
import 'package:flutter_app_client/config/EnumSum.dart';
import 'package:flutter_app_client/main.dart';
import 'package:flutter_app_client/utils/core/http/request.dart';
import 'package:flutter_app_client/utils/sputils.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:isolate/load_balancer.dart';

Dio api = Dio();

/// 多线程服务请求类
class TheadAxios {
  static Future<Map<dynamic, dynamic>> getData(
      {String? url, Method? method, Map? params}) async {
    final ReceivePort receivePort = ReceivePort();
    final LoadBalancer lb = await loadBalancer;
    // 开启一个线程
    // TODO: @date:2022-08-10 14:51:41 @author: 谭人杰 !
    await lb.run<dynamic, SendPort>(_echo, receivePort.sendPort);
    final SendPort sendPort = await receivePort.first;
    final ReceivePort resultPort = ReceivePort();
    final cookie = SPUtils.getUserInfo();
    if (BaseConfig.whiteList.where((element) => element == url).isEmpty) {
      if (cookie == null) {
        EasyLoading.showToast("安全令牌已失效，请重新登陆",
            duration: const Duration(seconds: 2));
        BaseConfig.navigatorKey.currentState!.pushReplacementNamed('/login');
      }
      Axios.dio.options.headers = {
        "token": jsonDecode(cookie!)["token"],
      };
    }
    sendPort.send(
      _SendPortMsg(
        url: url!,
        method: method!,
        params: params!,
        sendPort: resultPort.sendPort,
      ),
    );
    EasyLoading.show();
    Map<String, dynamic> res = await resultPort.first;
    if (res["code"] != 20000) {
      EasyLoading.showToast(res["msg"], duration: const Duration(seconds: 2));
    } else {
      EasyLoading.dismiss();
    }
    return res;
  }
}

_echo(SendPort sendPort) {
  final ReceivePort receivePort = ReceivePort();
  sendPort.send(receivePort.sendPort);
  receivePort.listen((message) async {
    final String url = message.url;
    final Method method = message.method ?? Method.get;
    final Map<String, dynamic> params = message.params;
    try {
      Map<String, dynamic> res = {};
      switch (method) {
        case Method.post:
          res = await Axios.post(url, params);
          break;
        case Method.get:
          res = await Axios.get(url, params);
          break;
        case Method.postjson:
          res = await Axios.postJson(url, params);
          break;
        default:
          break;
      }
      Map<String, dynamic> sendData = parsedResult(res);
      message.sendPort.send(sendData);
    } catch (e) {
      try {
        Map<String, dynamic> sendData = errorResult(e);
        message.sendPort.send(sendData);
      } catch (e) {
        print('消息发送报错:$e');
      }
    }
  });
}

class _SendPortMsg {
  // final String token;
  final String? url;
  final Method? method;
  final Map? params;
  final SendPort? sendPort;

  _SendPortMsg({
    this.url,
    this.method,
    this.params,
    this.sendPort,
  });
}

Map<String, dynamic> parsedResult(res) {
  Map<String, dynamic> sendData = {
    'code': res['code'],
    'msg': res['msg'],
    'data': res['data'],
  };
  return sendData;
}

Map<String, dynamic> errorResult(e) {
  Map<String, dynamic> sendData = {
    'code': 50000,
    'msg': e.toString(),
    'data': null,
  };
  return sendData;
}
