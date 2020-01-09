import 'package:flutter/material.dart';
import 'package:portfolio/src/utils/size_config.dart';

/// Definition of the application theme and styling.
class AppTheme {
  static const Brightness brightness = Brightness.light;

  static const Color primaryColor = Color.fromRGBO(247, 67, 64, 1);
  static const Color backgroundColor = Color.fromRGBO(237, 242, 244, 1);
  static const Color onBackgroundColor = Color.fromRGBO(56, 56, 56, 1);

  static const _colorScheme = ColorScheme(
    brightness: brightness,
    primary: primaryColor,
    primaryVariant: primaryColor,
    secondary: primaryColor,
    secondaryVariant: primaryColor,
    surface: backgroundColor,
    background: backgroundColor,
    error: Colors.red,
    onPrimary: backgroundColor,
    onSecondary: backgroundColor,
    onSurface: onBackgroundColor,
    onBackground: onBackgroundColor,
    onError: backgroundColor,
  );

  static TextTheme _englishLike2018 = Typography.englishLike2018.apply(
    fontFamily: 'OpenSans',
    displayColor: onBackgroundColor,
    bodyColor: onBackgroundColor,
    decorationColor: onBackgroundColor,
  );

  static ThemeData themeData = ThemeData.from(
    colorScheme: _colorScheme,
    textTheme: _englishLike2018,
  ).copyWith(
    appBarTheme: AppBarTheme(
      color: _colorScheme.background,
      brightness: brightness,
    ),
  );

  /// Initialize the theme based on the current [SizeConfig].
  void init() {
    _englishLike2018 = Typography.englishLike2018.apply(
      fontFamily: 'OpenSans',
      fontSizeFactor: 0.05 * SizeConfig.textMultiplier,
      displayColor: onBackgroundColor,
      bodyColor: onBackgroundColor,
      decorationColor: onBackgroundColor,
    );

    themeData = ThemeData.from(
      colorScheme: _colorScheme,
      textTheme: _englishLike2018,
    ).copyWith(
      appBarTheme: AppBarTheme(
        color: _colorScheme.background,
        brightness: brightness,
      ),
    );
  }
}
