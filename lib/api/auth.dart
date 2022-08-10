import 'package:flutter_app_client/config/EnumSum.dart';
import 'package:flutter_app_client/utils/core/http/TheadAxios.dart';
import 'package:flutter_app_client/utils/core/http/request.dart';

class Auth {
  static Future login(Map<String, dynamic> params) {
    return TheadAxios.getData(
      url: "/auth/login",
      params: params,
      method: Method.post,
    );
  }

  static Future submit(Map<String, dynamic> params) {
    return Axios.post("/user/getlist", params);
  }

  static Future getlist(Map<String, dynamic> params) {
    return TheadAxios.getData(
      url: "/list",
      params: params,
    );
  }
}
