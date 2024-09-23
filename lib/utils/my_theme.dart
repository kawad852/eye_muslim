import 'package:eye_muslim/utils/base_extensions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kEditorBottomPadding = 24.0;

class MyTheme {
  static final String fontFamily = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
  ).fontFamily!;

  static const double radius6XL = 40;
  static const double radius5XL = 38;
  static const double radius4XL = 32;
  static const double radius3XL = 28;
  static const double radius2XL = 24;
  static const double radiusXL = 20;
  static const double radiusL = 16;
  static const double radiusM = 12;
  static const double radiusS = 8;
  static const double radiusXS = 4;

  static const _h1Style = TextStyle(fontSize: 32); // Headline Large
  static const _h2Style = TextStyle(fontSize: 29); // Headline Medium
  static const _h3Style = TextStyle(fontSize: 26); // Title Large
  static const _h4Style = TextStyle(fontSize: 23); // Title Medium
  static const _h5Style = TextStyle(fontSize: 20); // Title Small
  static const _h6Style = TextStyle(fontSize: 18); // Body Large
  static const _bodyStyle = TextStyle(fontSize: 16); // Body Medium
  static const _captionStyle = TextStyle(fontSize: 14); // Label Large
  static const _overLineStyle = TextStyle(fontSize: 13); // Label Medium
  static const _labelSmallStyle = TextStyle(fontSize: 12); // Label Small

  static bool isLightTheme(BuildContext context) => context.colorScheme.brightness == Brightness.light;

  ThemeData materialTheme(BuildContext context, ColorScheme colorScheme) {
    return ThemeData(
      useMaterial3: true,
      fontFamily: fontFamily,
      colorScheme: colorScheme,
      appBarTheme: AppBarTheme(
        centerTitle: false,
        backgroundColor: colorScheme.primary,
        foregroundColor: const Color(0xFFE6E8F4),
        titleTextStyle: _h5Style.copyWith(
          fontWeight: FontWeight.w300,
          color: context.colorScheme.onPrimary,
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusS),
          ),
          textStyle: _captionStyle.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      dividerTheme: DividerThemeData(
        color: colorScheme.outline,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colorScheme.tertiary,
          textStyle: _captionStyle.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      // cardTheme: CardTheme(
      //   color: colorScheme.primaryContainer,
      //   shadowColor: colorScheme.shadow,
      // ),
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusS),
          borderSide: BorderSide(color: colorScheme.outlineVariant),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusS),
          borderSide: BorderSide(color: colorScheme.outlineVariant),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusS),
          borderSide: BorderSide(color: colorScheme.outlineVariant),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusS),
          borderSide: BorderSide(color: colorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusS),
          borderSide: BorderSide(color: colorScheme.error),
        ),
      ),
      textTheme: const TextTheme(
        ///Headline
        headlineLarge: _h1Style,
        headlineMedium: _h2Style,

        ///Title
        titleLarge: _h3Style,
        titleMedium: _h4Style,
        titleSmall: _h5Style,

        ///Body
        bodyLarge: _h6Style,
        bodyMedium: _bodyStyle,

        ///Label
        labelLarge: _captionStyle,
        labelMedium: _overLineStyle,
        labelSmall: _labelSmallStyle,
      ),
    );
  }
}
