import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app_client/api/auth.dart';
import 'package:flutter_app_client/mobileUI/privacy.dart';
import 'package:flutter_app_client/page/userManger/login/loginModel.dart';

import 'package:flutter_app_client/store/provider.dart';
import 'package:flutter_app_client/utils/sputils.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

mixin LoginMixin<T extends StatefulWidget> on State<T> {
  bool isShowPassWord = false;
  FocusNode blankNode = FocusNode();
  TextEditingController unameController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  GlobalKey formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    unameController.text = "1";
    pwdController.text = "1";
    if (!SPUtils.isAgreePrivacy()!) {
      PrivacyUtils.showPrivacyDialog(context, onAgressCallback: () {
        Navigator.of(context).pop();
        SPUtils.saveIsAgreePrivacy(true);
        EasyLoading.showSuccess("已同意隐私协议!");
      });
    }
  }

  ///点击控制密码是否显示
  void showPassWord() {
    setState(() {
      isShowPassWord = !isShowPassWord;
    });
  }

  void closeKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(blankNode);
  }

  //验证通过提交数据
  void onSubmit(BuildContext context) async {
    closeKeyboard(context);
    UserInfoStore userInfo = Provider.of<UserInfoStore>(context, listen: false);
    var s = await Auth.login({});
    LoginModel res = LoginModel.fromJson(s);

    userInfo.userInfo = json.encode(res.msg);
    Navigator.of(context).pushNamedAndRemoveUntil("/home", (route) => false);
  }
}
