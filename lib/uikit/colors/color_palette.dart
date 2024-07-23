import 'package:flutter/material.dart';

// DARK
/// background: #222222;
/// shimer: linear-gradient(270deg, #777777 0%, #333333 100%);
/// icon_vert: #FFFFFF
/// main_text: #FFFFFF;
/// optional_text: #999999;
/// secondary_text: #AAAAAA;
/// icon: #888888;

abstract class DarkColorPalette {
  static const Color background = Color(0xFF222222);
  static const Color shimmerStart = Color(0xFF777777);
  static const Color shimmerEnd = Color(0xFF333333);
  static const Color iconVert = Color(0xFFFFFFFF);
  static const Color mainText = Color(0xFFFFFFFF);
  static const Color optionalText = Color(0xFF999999);
  static const Color secondaryText = Color(0xFFAAAAAA);
  static const Color icon = Color(0xFF888888);
}

// LIGHT
/// background: #FFFFFF;
/// shimer: linear-gradient(270deg, #F0F0F0 0%, #CCCCCC 100%);
/// icon_vert: #1E1E1E
/// main_text: #222222
/// optional_text: #444444;
/// secondary_text: #AAAAAA;
/// icon: #FFFFFF;

abstract class LightColorPalette {
  static const Color background = Color(0xFFFFFFFF);
  static const Color shimmerStart = Color(0xFFF0F0F0);
  static const Color shimmerEnd = Color(0xFFCCCCCC);
  static const Color iconVert = Color(0xFF1E1E1E);
  static const Color mainText = Color(0xFF222222);
  static const Color optionalText = Color(0xFF444444);
  static const Color secondaryText = Color(0xFFAAAAAA);
  static const Color icon = Color(0xFFFFFFFF);
}
