class Verify {
  /// 验证是否为http
  static bool isHttp(String url) {
    RegExp rex = RegExp(r"^((https|http|ftp|rtsp|mms)?:\/\/)[^\s]+");
    return rex.firstMatch(url) == null ? false : true;
  }
}
