import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/storage/theme/theme_storage.dart';

class ThemeProvider with ChangeNotifier {
  final ThemeStorage _themeStorage;

  ThemeProvider({
    required ThemeStorage themeStorage,
  }) : _themeStorage = themeStorage;

  late final ValueNotifier<ThemeMode> _themeMode =
      ValueNotifier<ThemeMode>(_themeStorage.getThemeMode() ?? ThemeMode.light);

  ValueListenable<ThemeMode> get themeMode => _themeMode;

  bool get isDarkMode => _themeMode.value == ThemeMode.dark;

  Future<void> setThemeMode(ThemeMode mode) async {
    if (mode == _themeMode.value) return;
    await _themeStorage.setThemeMode(mode: mode);
    _themeMode.value = mode;
    notifyListeners();
  }

  Future<void> toggleThemeMode() async {
    final mode = isDarkMode ? ThemeMode.light : ThemeMode.dark;
    setThemeMode(mode);
  }
}
