import 'package:eye_muslim/screens/base/app_nav_bar.dart';
import 'package:eye_muslim/screens/home/home_screen.dart';
import 'package:flutter/cupertino.dart';

class AppRoutes {
  static const String defaultRouteName = Navigator.defaultRouteName;

  static const String appNavBar = '/app-nav-bar';
  static const String home = '/home';

  static Map<dynamic, String> names = {
    AppNavBar: appNavBar,
    HomeScreen: home,
  };
}
