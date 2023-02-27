import 'package:flutter/material.dart';

import 'color_palette.dart';

ThemeData _themeLight = ThemeData.light();

final colorfulTheme = ThemeData(
  listTileTheme:
      ListTileThemeData(selectedTileColor: Colorful.yellow.withOpacity(0.3)),
  colorScheme: const ColorScheme(
    primary: Colorful.blueDark,
    background: Colorful.white,
    brightness: Brightness.light,
    error: Colorful.errorColor,
    onBackground: Colorful.blueDark,
    onError: Colorful.white,
    onPrimary: Colorful.yellow,
    secondary: Colorful.pink,
    onSecondary: Colorful.white,
    surface: Colorful.white,
    onSurface: Colorful.yellow,
  ),
  textTheme: _textLight(_themeLight.textTheme),
);

TextTheme _textLight(TextTheme base) {
  return base.copyWith(
    bodyLarge: base.bodyLarge!.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.bold,
    ),
    bodySmall: base.bodySmall!.copyWith(
      fontSize: 11,
      color: Colors.black,
    ),
  );
}
