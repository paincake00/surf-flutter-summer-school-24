import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/presentation/uikit/colors/color_palette.dart';

class AppColorScheme extends ThemeExtension<AppColorScheme> {
  final Color background;
  final Color shimmerStart;
  final Color shimmerEnd;
  final Color iconVert;
  final Color mainText;
  final Color optionalText;
  final Color secondaryText;
  final Color icon;

  AppColorScheme.light()
      : background = LightColorPalette.background,
        shimmerStart = LightColorPalette.shimmerStart,
        shimmerEnd = LightColorPalette.shimmerEnd,
        iconVert = LightColorPalette.iconVert,
        mainText = LightColorPalette.mainText,
        optionalText = LightColorPalette.optionalText,
        secondaryText = LightColorPalette.secondaryText,
        icon = LightColorPalette.icon;

  AppColorScheme.dark()
      : background = DarkColorPalette.background,
        shimmerStart = DarkColorPalette.shimmerStart,
        shimmerEnd = DarkColorPalette.shimmerEnd,
        iconVert = DarkColorPalette.iconVert,
        mainText = DarkColorPalette.mainText,
        optionalText = DarkColorPalette.optionalText,
        secondaryText = DarkColorPalette.secondaryText,
        icon = DarkColorPalette.icon;

  const AppColorScheme._({
    required this.background,
    required this.shimmerStart,
    required this.shimmerEnd,
    required this.iconVert,
    required this.mainText,
    required this.optionalText,
    required this.secondaryText,
    required this.icon,
  });

  @override
  ThemeExtension<AppColorScheme> copyWith({
    Color? background,
    Color? shimmerStart,
    Color? shimmerEnd,
    Color? iconVert,
    Color? mainText,
    Color? optionalText,
    Color? secondaryText,
    Color? icon,
  }) {
    return AppColorScheme._(
      background: background ?? this.background,
      shimmerStart: shimmerStart ?? this.shimmerStart,
      shimmerEnd: shimmerEnd ?? this.shimmerEnd,
      iconVert: iconVert ?? this.iconVert,
      mainText: mainText ?? this.mainText,
      optionalText: optionalText ?? this.optionalText,
      secondaryText: secondaryText ?? this.secondaryText,
      icon: icon ?? this.icon,
    );
  }

  @override
  ThemeExtension<AppColorScheme> lerp(
    covariant ThemeExtension<AppColorScheme>? other,
    double t,
  ) {
    if (other is! AppColorScheme) {
      return this;
    }
    return AppColorScheme._(
      background: Color.lerp(background, other.background, t)!,
      shimmerStart: Color.lerp(shimmerStart, other.shimmerStart, t)!,
      shimmerEnd: Color.lerp(shimmerEnd, other.shimmerEnd, t)!,
      iconVert: Color.lerp(iconVert, other.iconVert, t)!,
      mainText: Color.lerp(mainText, other.mainText, t)!,
      optionalText: Color.lerp(optionalText, other.optionalText, t)!,
      secondaryText: Color.lerp(secondaryText, other.secondaryText, t)!,
      icon: Color.lerp(icon, other.icon, t)!,
    );
  }

  static AppColorScheme of(BuildContext context) {
    return Theme.of(context).extension<AppColorScheme>()!;
  }
}
