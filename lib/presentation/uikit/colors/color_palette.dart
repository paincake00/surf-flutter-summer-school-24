import 'package:flutter/material.dart';

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
