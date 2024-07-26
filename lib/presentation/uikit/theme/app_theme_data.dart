import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/presentation/uikit/colors/color_scheme.dart';

class AppThemeData {
  static final lightTheme = ThemeData(
    extensions: [_lightColorScheme],
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: _lightColorScheme.mainText,
      onPrimary: _lightColorScheme.icon,
      secondary: _lightColorScheme.secondaryText,
      onSecondary: _lightColorScheme.iconVert,
      surface: _lightColorScheme.background,
      onSurface: _lightColorScheme.optionalText,
      error: _lightColorScheme.icon,
      onError: _lightColorScheme.icon,
      tertiary: _lightColorScheme.shimmerStart,
      onTertiary: _lightColorScheme.shimmerEnd,
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        color: _lightColorScheme.mainText,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    ),
  );

  static final darkTheme = ThemeData(
    extensions: [_darkColorScheme],
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: _darkColorScheme.mainText,
      onPrimary: _darkColorScheme.icon,
      secondary: _darkColorScheme.secondaryText,
      onSecondary: _darkColorScheme.iconVert,
      surface: _darkColorScheme.background,
      onSurface: _darkColorScheme.optionalText,
      error: _darkColorScheme.icon,
      onError: _darkColorScheme.icon,
      tertiary: _darkColorScheme.shimmerStart,
      onTertiary: _darkColorScheme.shimmerEnd,
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        color: _darkColorScheme.mainText,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    ),
  );

  static final _lightColorScheme = AppColorScheme.light();
  static final _darkColorScheme = AppColorScheme.dark();
}
