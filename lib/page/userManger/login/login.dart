import 'package:flutter/material.dart';
import 'package:flutter_app_client/page/userManger/login/login_mixin.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/components/button/gf_button.dart';

/// @description: 登陆
/// @fileName: login.dart
/// @author: 谭人杰
/// @date: 2020-09-16 17:11:24
/// @后台人员:
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with LoginMixin {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: Container(
          color: const Color(0xFF5AA6FD).withOpacity(0.1),
          height: double.infinity,
          child: GestureDetector(
            onTap: () {
              // 点击空白页面关闭键盘
              closeKeyboard(context);
            },
            // child: buildForm(context),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 24.0,
              ),
              child: buildForm(context),
            ),
          ),
        ),
      ),
      onWillPop: () async {
        return Future.value(false);
      },
    );
  }

  //构建表单
  Widget buildForm(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            autofocus: false,
            controller: unameController,
            decoration: InputDecoration(
              hintText: "请输入用户名",
              hintStyle: TextStyle(fontSize: ScreenUtil().setSp(12)),
              icon: const Icon(
                Icons.person,
              ),
            ),
            //校验用户名
            validator: (v) {
              return v!.trim().isNotEmpty ? null : "用户名不可为空";
            },
          ),
          TextFormField(
            controller: pwdController,
            decoration: InputDecoration(
              hintText: "请输入密码",
              hintStyle: const TextStyle(fontSize: 12),
              icon: const Icon(Icons.lock),
              suffixIcon: IconButton(
                icon: Icon(
                  isShowPassWord ? Icons.visibility : Icons.visibility_off,
                  color: Colors.black,
                ),
                onPressed: showPassWord,
              ),
            ),
            obscureText: !isShowPassWord,
            //校验密码
            validator: (v) {
              return v!.trim().isNotEmpty ? null : "密码不可为空";
            },
          ),
          // 登录按钮
          Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Builder(
                    builder: (context) {
                      return GFButton(
                        text: "登录",
                        onPressed: () {
                          //由于本widget也是Form的子代widget，所以可以通过下面方式获取FormState
                          if (Form.of(context)!.validate()) {
                            onSubmit(context);
                          }
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
