import 'package:flutter/material.dart';
import 'package:flutter_app_client/mobileUI/AppBar/simpleAppBar.dart';
import 'package:flutter_app_client/store/provider.dart';
import 'package:flutter_app_client/tabbar/tab_center/tab_center.dart';
import 'package:flutter_app_client/tabbar/tab_home/tab_home.dart';
import 'package:flutter_app_client/tabbar/tab_owner/tab_owner.dart';
import 'package:flutter_app_client/tabbar/tab_test/tab_test.dart';
import 'package:flutter_app_client/utils/core/click.dart';
import 'package:provider/provider.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  List<BottomNavigationBarItem> getTabs(BuildContext context) => [
        const BottomNavigationBarItem(label: "首页", icon: Icon(Icons.home)),
        const BottomNavigationBarItem(
            label: "中心", icon: Icon(Icons.center_focus_weak)),
        const BottomNavigationBarItem(label: "测试", icon: Icon(Icons.textsms)),
        const BottomNavigationBarItem(label: "我的", icon: Icon(Icons.person)),
      ];

  List getTitle(BuildContext context) => [
        const SimpleAppBar(
          title: "首页",
        ),
        null,
        null,
        null,
      ];

  List<Widget> getTabWidget(BuildContext context) => [
        TabHome(),
        const TabCenter(),
        TabTest(),
        const TabOwner(),
      ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var tabs = getTabs(context);
    var titles = getTitle(context);
    return Consumer<AppStatus>(
      builder: (context, status, child) {
        return WillPopScope(
          child: Scaffold(
            key: _scaffoldKey,
            appBar: titles[status.tabIndex],
            body: IndexedStack(
              index: status.tabIndex,
              children: getTabWidget(context),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: tabs,
              type: BottomNavigationBarType.fixed,
              currentIndex: status.tabIndex,
              onTap: (index) => {status.tabIndex = index},
            ),
          ),
          onWillPop: () =>
              ClickUtils.exitBy2Click(status: _scaffoldKey.currentState),
        );
      },
    );
  }
}
