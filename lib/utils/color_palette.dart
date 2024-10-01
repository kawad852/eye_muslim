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
  Color get black1D50 => const Color(0x801D1D1D);

  //green
  Color get green1C9 => const Color(0xFF1C9924);
  Color get green37B => const Color(0xFF37BA73);
  Color get green215 => const Color(0xFF215329);
  Color get green80A => const Color(0xFF80AD80);
  Color get green2D8 => const Color(0xFF2D8C2E);
  Color get green577 => const Color(0xFF577F5B);
  Color get green00A => const Color(0xFF00A01A);
  Color get green008 => const Color(0xFF008C16);


 

  //grey
  Color get grey81 => const Color(0xFF818181);
  Color get greyECE => const Color(0xFFECECEC);
  Color get greyC7D => const Color(0xFFC7D5C2);
  Color get greyEEE => const Color(0xFFEEEEEE);
  Color get greyD9D => const Color(0xFFD9D9D9);
  Color get greyE8F => const Color(0xFFE8F5E3);
  Color get greyF4F => const Color(0xFFF4F4F4);
  Color get grey848 => const Color(0xFF848383);
  Color get greyCAC => const Color(0xFFCACACA);
  Color get greyF2F => const Color(0xFFF2F2F2);
  Color get greyEAE => const Color(0xFFEAEAEA);




}
