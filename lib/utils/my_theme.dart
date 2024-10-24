import 'package:eye_muslim/utils/base_extensions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kEditorBottomPadding = 16.0;
const kProductBubbleHeight = 70.0;
const kBarLeadingWith = 250.0;
const kBarCollapsedHeight = 300.0;

class MyTheme {
  static const Color primaryLightColor = Color(0xFF1A73E8);
  static const Color secondaryLightColor = Color(0xFFFFCA28);
  static const Color tertiaryLightColor = Color(0xFF1B3A57);

  static final String fontFamily = GoogleFonts.cairo().fontFamily!;

  static const double radiusPrimary = 5;
  static const double radiusSecondary = 10;
  static const double radiusTertiary = 16;

  static bool isLightTheme(BuildContext context) => context.colorScheme.brightness == Brightness.light;

  static InputDecorationTheme inputDecorationTheme(BuildContext context, ColorScheme colorScheme) => InputDecorationTheme(
        filled: true,
        isDense: true,
        fillColor: context.colorPalette.greyECE,
        hintStyle: TextStyle(
          fontSize: 14,
          color: context.colorPalette.greyECE,
        ),
        contentPadding: const EdgeInsetsDirectional.symmetric(horizontal: 5, vertical: 10).copyWith(start: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: context.colorPalette.greyECE),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: context.colorPalette.greyECE),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: context.colorPalette.greyECE),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.error),
        ),
      );

  ThemeData materialTheme(BuildContext context, ColorScheme colorScheme) {
    return ThemeData(
      useMaterial3: true,
      fontFamily: fontFamily,
      colorScheme: colorScheme,
      appBarTheme: AppBarTheme(
        color: colorScheme.surface,
      ),
      listTileTheme: ListTileThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusPrimary),
        ),
      ),
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusPrimary),
          ),
        ),
      ),
      bottomAppBarTheme: BottomAppBarTheme(
        surfaceTintColor: colorScheme.surface,
        color: colorScheme.surface,
        elevation: 0,
      ),
      inputDecorationTheme: inputDecorationTheme(context, colorScheme),
    );
  }
}
