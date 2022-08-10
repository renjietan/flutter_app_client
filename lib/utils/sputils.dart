import 'package:shared_preferences/shared_preferences.dart';

class SPUtils {
  /// 内部构造方法，可避免外部暴露构造函数，进行实例化
  SPUtils._internal();

  static SharedPreferences? _spf;

  static Future<SharedPreferences> init() async {
    _spf ??= await SharedPreferences.getInstance();
    return _spf!;
  }

  /// 用户信息
  static Future<bool> saveUserInfo(String nickName) {
    return _spf!.setString('key_nickname', nickName);
  }

  static String? getUserInfo() {
    return _spf!.getString('key_nickname');
  }

  static Future<bool> removeUserInfo() {
    return _spf!.clear();
  }

  ///是否同意隐私协议
  static Future<bool> saveIsAgreePrivacy(bool isAgree) {
    return _spf!.setBool('key_agree_privacy', isAgree);
  }

  static bool? isAgreePrivacy() {
    if (!_spf!.containsKey('key_agree_privacy')) {
      return false;
    }
    return _spf!.getBool('key_agree_privacy');
  }
}
