import 'package:eye_muslim/utils/my_theme.dart';
import 'package:flutter/material.dart';

class ColorPalette {
  final BuildContext _context;

  ColorPalette(this._context);

  static of(BuildContext context) => ColorPalette(context);

  bool get _isLightTheme => MyTheme.isLightTheme(_context);
  
  ///common
  Color get white => Colors.white;
  Color get black => Colors.black;

  //green
  Color get green1C9 => const Color(0xFF1C9924);
  Color get green37B => const Color(0xFF37BA73);

  //grey
  Color get grey81 => const Color(0xFF818181);

}
