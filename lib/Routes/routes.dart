import 'package:flutter/material.dart';
import 'package:seeu/Tabs/home.dart';
import 'package:seeu/Tabs/news.dart';
import 'package:seeu/Tabs/setting.dart';

final routes = {
  '/tabs/home':(context) => HomePage(),
  '/tabs/news':(context) => NewsPage(),
  '/tabs/setting':(context) => SettingPage()
};
//固定写法
var onGenerateRoute = (RouteSettings settings) {
  // 统一处理
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};