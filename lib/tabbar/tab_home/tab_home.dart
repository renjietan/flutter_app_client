import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_app_client/tabbar/tab_home/tab_home_mixin.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabHome extends StatefulWidget {
  @override
  _TabHomeState createState() => _TabHomeState();
}

class _TabHomeState extends State<TabHome> with TabHomeMixin {
  // MethodChannel? _channel;
  @override
  void initState() {
    // _channel = const MethodChannel("com.example.flutter_app_client");
    // loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0x05373737),
      child: EasyRefresh.custom(
        header: MaterialHeader(),
        footer: MaterialFooter(),
        onRefresh: () async {},
        onLoad: () async {},
        slivers: <Widget>[
          //=====轮播图=====//
          SliverToBoxAdapter(
            child: getBannerWidget(),
          ),

          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[],
            ),
          ),
        ],
      ),
    );
  }

  final List<String> urls = [
    "assets/images/banner1.jpg",
    "assets/images/banner1.jpg",
    "assets/images/banner1.jpg",
    "assets/images/banner1.jpg",
    "assets/images/banner1.jpg",
    "assets/images/banner1.jpg",
  ];

  Widget getBannerWidget() {
    return SizedBox(
      height: ScreenUtil().setHeight(150),
      child: Swiper(
        autoplay: true,
        duration: 2000,
        autoplayDelay: 5000,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.transparent,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(0),
              child: Image.asset(
                urls[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        onTap: (value) {},
        itemCount: urls.length,
        pagination: const SwiperPagination(),
      ),
    );
  }
}
