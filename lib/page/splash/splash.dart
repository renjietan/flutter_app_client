import 'package:flutter/material.dart';
import 'package:flutter_app_client/page/splash/splash_mixin.dart';

//类似广告启动页
class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SplashMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: const Center(
        child: FlutterLogo(size: 96),
        // child: proca,
      ),
    );
  }
}
