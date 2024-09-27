import 'package:eye_muslim/alerts/loading/app_loading_indicators.dart';
import 'package:eye_muslim/models/countries_model.dart';
import 'package:eye_muslim/providers/app_provider.dart';
import 'package:eye_muslim/utils/app_constants.dart';
import 'package:eye_muslim/utils/app_routes.dart';
import 'package:eye_muslim/utils/color_palette.dart';
import 'package:eye_muslim/utils/countries.dart';
import 'package:eye_muslim/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension LanguageExtension on BuildContext {
  AppLocalizations get appLocalization => AppLocalizations.of(this)!;

  String get languageCode => Localizations.localeOf(this).languageCode;

  bool get isRTL => Localizations.localeOf(this).languageCode == LanguageEnum.arabic;
}

extension AppLoadingIncidatorExtension on BuildContext {
  AppLoadingIndicator get loaders => AppLoadingIndicator.of(this);
}

extension ThemeExtension on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorPalette get colorPalette => ColorPalette.of(this);
}

extension MediaQueryExtension on BuildContext {
  Size get mediaQuery => MediaQuery.sizeOf(this);
}

extension CommonExtensions on BuildContext {
  void unFocusKeyboard() => FocusManager.instance.primaryFocus?.unfocus();
  double get systemButtonHeight => Theme.of(this).buttonTheme.height;
  String? get countryCode => AppProvider.countryCode;
  String getDialCode(String code) => kCountries.singleWhere((element) => element.code == code, orElse: () => CountryModel(code: kFallBackCountryCode)).dialCode!;

  TextStyle get mediumBoldTitle => textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold);
  TextStyle get largeBoldTitle => textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold);

  Future<T?> navigate<T>(
    Widget Function(BuildContext context) builder, {
    bool fullscreenDialog = false,
  }) {
    return Navigator.push<T?>(
      this,
      MaterialPageRoute(builder: builder, fullscreenDialog: fullscreenDialog),
    ).then((value) => value);
  }
}

extension NavigatorExtension on BuildContext {
  Future<dynamic> push(Widget screen) async {
    final routeName = AppRoutes.names[screen.runtimeType];
    final value = await Navigator.push(
      this,
      MaterialPageRoute(
        builder: (context) {
          return screen;
        },
        settings: RouteSettings(name: routeName),
      ),
    );
    return value;
  }

  void pushReplacement(
    Widget screen, {
    Function(dynamic value)? then,
  }) async {
    final routeName = AppRoutes.names[screen.runtimeType];
    final value = await Navigator.pushReplacement(
      this,
      MaterialPageRoute(
        builder: (context) {
          return screen;
        },
        settings: RouteSettings(name: routeName),
      ),
    );
    if (then != null) {
      then(value);
    }
  }

  Future<void> pushAndRemoveUntil(Widget screen) async{
    final routeName = AppRoutes.names[screen.runtimeType];
    Navigator.pushAndRemoveUntil(
      this,
      MaterialPageRoute(
        builder: (context) {
          return screen;
        },
        settings: RouteSettings(name: routeName),
      ),
      (route) => false,
    );
  }

  void pop([value]) => Navigator.pop(this, value);
}
