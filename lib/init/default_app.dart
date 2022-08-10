import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_client/page/splash/splash.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_app_client/config/baseConfig.dart';
import 'package:flutter_app_client/utils/core/http/request.dart';

import 'package:flutter_app_client/router/route_map.dart';
import 'package:flutter_app_client/router/router.dart';
import 'package:flutter_app_client/store/provider.dart';
import 'package:flutter_app_client/utils/sputils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//默认App的启动
class DefaultApp {
  //运行app
  static void run() async {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xFF5AA6FD),
      systemNavigationBarDividerColor: null,
      statusBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    ));

    SPUtils.init().then((value) => runApp(Store.init(const MyApp())));
    initApp();
  }

  static int syncFibonacci(int n) {
    return n < 2 ? n : syncFibonacci(n - 2) + syncFibonacci(n - 1);
  }

  //程序初始化操作
  static void initApp() async {
    Axios.init();
    CustomRouter.init();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override

  ///  @date:2020-09-17 15:46:18 @author: 谭人杰
  /// 不可按照官方API逆行封装，导致root context指向问题
  /// 所以必须使MaterialApp作为element tree的root节点

  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(600, 1400),
      builder: (context, child) {
        return MaterialApp(
          title: 'flutter模板',
          debugShowCheckedModeBanner: false,
          navigatorKey: BaseConfig.navigatorKey,
          locale: const Locale("en", "US"), //设置这个可以使输入框文字垂直居中
          supportedLocales: const [
            Locale('zh', 'CH'),
            Locale('en', 'US'),
          ],
          localizationsDelegates: const [],
          theme: ThemeData(
            fontFamily: "PingFang", // 统一指定应用的字体。
          ),
          home: child,
          onGenerateRoute: CustomRouter.router?.generator,
          builder: (context, child) => Material(
            child: FlutterEasyLoading(
              child: GestureDetector(
                onTap: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus &&
                      currentFocus.focusedChild != null) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  }
                },
                child: child,
              ),
            ),
          ),
          routes: RouteMap.routes,
        );
      },
      child: SplashPage(),
    );
    // return material_app();
  }
}
