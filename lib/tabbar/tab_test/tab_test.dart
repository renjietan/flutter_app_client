import 'package:flutter/material.dart';
import 'package:flutter_app_client/mobileUI/AppBar/simpleAppBar.dart';
import 'package:flutter_app_client/page/userManger/login/login.dart';
import 'package:flutter_app_client/router/router.dart';
import 'package:flutter_app_client/utils/sputils.dart';
import 'package:getwidget/getwidget.dart';

class TabTest extends StatefulWidget {
  const TabTest({Key? key}) : super(key: key);

  @override
  _TabTestState createState() => _TabTestState();
}

class _TabTestState extends State<TabTest> {
  bool showFloatingToast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SimpleAppBar(
        title: "测试",
      ),
      body: GFFloatingWidget(
        verticalPosition: MediaQuery.of(context).size.width * 0.5,
        horizontalPosition: MediaQuery.of(context).size.height * 0.02,
        showBlurness: showFloatingToast,
        blurnessColor: Colors.black54,
        body: Column(
          children: [
            GFButton(
              onPressed: () {
                // CustomRouter.goto(context, "/login");
              },
              // blockButton: true,
              shape: GFButtonShape.pills,
            ),
            Container(
              margin: const EdgeInsets.only(left: 40, right: 40),
              child: GFButton(
                onPressed: () {
                  setState(() {
                    showFloatingToast = !showFloatingToast;
                  });
                },
                text: 'View Floating Toast',
              ),
            ),
          ],
        ),
        child: Container(
          child: GFButton(
            onPressed: () {
              setState(() {
                showFloatingToast = !showFloatingToast;
              });
            },
            // blockButton: true,
            shape: GFButtonShape.pills,
          ),
        ),
      ),
    );
  }
}
