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

  //black
  Color get black292 => const Color(0xFF292D32);

  //green
  Color get green1C9 => const Color(0xFF1C9924);
  Color get green37B => const Color(0xFF37BA73);
  Color get green215 => const Color(0xFF215329);
  Color get green80A => const Color(0xFF80AD80);
  Color get green2D8 => const Color(0xFF2D8C2E);

  //grey
  Color get grey81 => const Color(0xFF818181);
  Color get greyECE => const Color(0xFFECECEC);
  Color get greyC7D => const Color(0xFFC7D5C2);
  Color get greyEEE => const Color(0xFFEEEEEE);




}
