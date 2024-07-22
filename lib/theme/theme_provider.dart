import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/theme/dark_mode.dart';
import 'package:surf_flutter_summer_school_24/theme/light_mode.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkMode;

  void setTheme(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (isDarkMode) {
      setTheme(lightMode);
    } else {
      setTheme(darkMode);
    }
  }
}
