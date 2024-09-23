import 'package:eye_muslim/utils/my_theme.dart';
import 'package:flutter/material.dart';

class MyImages {
  static const String _path = 'assets/images/';

  static String logo(BuildContext context) => MyTheme.isLightTheme(context) ? '${_path}logo.svg' : '${_path}logo.svg';
  static const String map = '${_path}map.png';
  static const String greenBubble = '${_path}login-green_bubble.png';
  static const String pinkBubble = '${_path}login-pink_bubble.png';
  static const String lightPinkBubble = '${_path}login-light_pink_bubble.png';
  static const String greenBubble307 = '${_path}green-bubble-307x307.png';
  static const String loadingBag = '${_path}loading_bag.png';
  static const String loadingGlobe = '${_path}loading_globe.png';
  static const String loadingMarker = '${_path}loading_marker.png';
  static const String loadingPlane = '${_path}loading_plane.png';
  static const String loadingSign = '${_path}loading_sign.png';
}
