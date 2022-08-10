import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/utils.dart';

//隐私弹窗工具
class PrivacyUtils {
  PrivacyUtils._internal();

  //隐私服务政策地址
  static const PRIVACY_URL = 'https://www.baidu.com';

  static void showPrivacyDialog(BuildContext context,
      {VoidCallback? onAgressCallback}) {
    Utils.getPackageInfo().then((packageInfo) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("温馨提醒"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text("【${packageInfo.appName}】"),
                  const SizedBox(height: 5),
                  const Text.rich(TextSpan(children: [
                    TextSpan(text: "世界那么大，我想去看看!"),
                  ])),
                ],
              ),
            ),
            actions: <Widget>[
              OutlinedButton(
                child: const Text("不同意"),
                onPressed: () {
                  Navigator.of(context).pop();
                  showPrivacySecond(context,
                      onAgressCallback: onAgressCallback!);
                },
              ),
              OutlinedButton(
                onPressed: onAgressCallback ??
                    () {
                      Navigator.of(context).pop();
                    },
                child: const Text("同意"),
              ),
            ],
          );
        },
      );
    });
  }

  ///第二次提醒
  static void showPrivacySecond(BuildContext context,
      {VoidCallback? onAgressCallback}) {
    Utils.getPackageInfo().then((packageInfo) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("温馨提醒"),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[Text("世界那么大，我想去看看！")],
              ),
            ),
            actions: <Widget>[
              OutlinedButton(
                child: const Text("仍不同意"),
                onPressed: () {
                  Navigator.of(context).pop();
                  showPrivacyThird(context,
                      onAgressCallback: onAgressCallback!);
                },
              ),
              OutlinedButton(
                child: const Text("再看看"),
                onPressed: () {
                  Navigator.of(context).pop();
                  showPrivacyDialog(context,
                      onAgressCallback: onAgressCallback);
                },
              ),
            ],
          );
        },
      );
    });
  }

  ///第三次提醒
  static void showPrivacyThird(BuildContext context,
      {VoidCallback? onAgressCallback}) {
    Utils.getPackageInfo().then((packageInfo) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text("要不要再想想？"),
                ],
              ),
            ),
            actions: <Widget>[
              OutlinedButton(
                child: const Text("退出应用"),
                onPressed: () {
                  //退出程序
                  SystemNavigator.pop();
                },
              ),
              OutlinedButton(
                child: const Text("再看看"),
                onPressed: () {
                  Navigator.of(context).pop();
                  showPrivacyDialog(context,
                      onAgressCallback: onAgressCallback);
                },
              ),
            ],
          );
        },
      );
    });
  }
}
