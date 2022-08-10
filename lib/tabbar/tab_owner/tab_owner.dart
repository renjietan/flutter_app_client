import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_app_client/store/provider.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:provider/provider.dart';

class TabOwner extends StatefulWidget {
  const TabOwner({Key? key}) : super(key: key);

  @override
  _TabOwnerState createState() => _TabOwnerState();
}

class _TabOwnerState extends State<TabOwner>
    with SingleTickerProviderStateMixin {
  final ScrollController _controller = ScrollController();
  bool _isShow = false;
  List<Widget> _getGridBar() => List.generate(
        4,
        (index) => Expanded(
          child: Container(
            color: Colors.red,
            alignment: Alignment.center,
            child: const Text("首页"),
          ),
        ),
      ).toList();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _isShow =
            _controller.offset + kToolbarHeight + ScreenUtil().setHeight(45) >=
                    160
                ? true
                : false;
        print(_isShow);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      controller: _controller,
      headerSliverBuilder: (context, bool) {
        return [
          SliverAppBar(
            expandedHeight: kToolbarHeight + 50,
            pinned: true,
            flexibleSpace: SafeArea(
              child: Container(
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: (kToolbarHeight - 35) / 2,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Expanded(
                          child: TextField(),
                        ),
                        ...!_isShow
                            ? []
                            : [
                                const Icon(Icons.home),
                                const Icon(Icons.home),
                                const Icon(Icons.home),
                                const Icon(Icons.home),
                              ],
                      ],
                    ),
                    Expanded(
                      child: Row(
                        children: _isShow ? [] : _getGridBar(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ];
      },
      body: ListView(
        children: [
          GFButton(onPressed: () {
            Provider.of<UserInfoStore>(context, listen: false).userInfo = "";
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/login', (Route route) => false);
          })
        ],
      ),
    );
  }
}
