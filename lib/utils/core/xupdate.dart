import 'dart:io';

// import 'package:flutter_template/core/utils/toast.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_xupdate/flutter_xupdate.dart';

///版本更新工具
class XUpdate {
  XUpdate._internal();

  ///版本更新检查的地址
  static const String UPDATE_URL =
      "http://106.14.191.221:8888/app/autoUpdate/getNewVersion?deviceType=1";

  static void initAndCheck() {
    if (Platform.isAndroid) {
      init(
        url: UPDATE_URL,
      );
    }
  }

  ///初始化XUpdate
  static void init({
    String url = "",
  }) {
    FlutterXUpdate.init(
      debug: true,
      timeout: 60000,
    ).then((result) {
      if (url.isNotEmpty) {
        checkUpdate(url);
      }
    });
    FlutterXUpdate.setErrorHandler(
        onUpdateError: (Map<String, dynamic>? message) async {
      ///2004是无最新版本
      if (message!['code'] != 2004) {
        ///4000是下载失败
        if (message['code'] == 4000) {
          FlutterXUpdate.showRetryUpdateTipDialog(
              retryContent: "APK下载失败，是否考虑重新下载？", retryUrl: url);
        } else {
          // ToastUtils.error(message['detailMsg']);
        }
      }
    });
  }

  ///初始化XUpdate
  static void checkUpdate(String url) {
    if (url.isNotEmpty) {
      FlutterXUpdate.checkUpdate(url: url, supportBackgroundUpdate: true);
    }
  }

  ///初始化XUpdate
  static void checkUpdateWithErrorTip({String url = UPDATE_URL}) {
    FlutterXUpdate.setErrorHandler(
        onUpdateError: (Map<String, dynamic>? message) async {
      ///4000是下载失败
      if (message!['code'] == 4000) {
        FlutterXUpdate.showRetryUpdateTipDialog(
            retryContent: "无法继续下载，是否考虑重新下载？", retryUrl: UPDATE_URL);
      } else {
        // ToastUtils.error(message['message']);
        EasyLoading.showError(message['message']);
      }
    });
    checkUpdate(url);
  }
}
