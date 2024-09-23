import 'package:eye_muslim/utils/my_theme.dart';
import 'package:flutter/material.dart';

class ColorPalette {
  final BuildContext _context;

  ColorPalette(this._context);

  static of(BuildContext context) => ColorPalette(context);

  bool get _isLightTheme => MyTheme.isLightTheme(_context);

  Color get surface => _isLightTheme ? const Color(0xFFFFFFFF) : const Color(0xFFFFFFFF);
  Color get primary => _isLightTheme ? const Color(0xFF777AF2) : const Color(0xFF777AF2);
  Color get secondary => _isLightTheme ? const Color(0xFF63F4D7) : const Color(0xFF63F4D7);
  Color get button => _isLightTheme ? const Color(0xFF1e266d) : const Color(0xFF1e266d);
  Color get primaryContainer => _isLightTheme ? const Color(0xFF8859E0) : const Color(0xFF8859E0);
  Color get onPrimaryContainer => _isLightTheme ? const Color(0xFFFFFFFF) : const Color(0xFFFFFFFF);
  Color get neutralBlue => _isLightTheme ? const Color(0xFF5AA4E1) : const Color(0xFF5AA4E1);
  Color get grey399 => _isLightTheme ? const Color(0xFF909399) : const Color(0xFF909399);
  Color get grey7ED => _isLightTheme ? const Color(0xFFE4E7ED) : const Color(0xFFE4E7ED);
}
