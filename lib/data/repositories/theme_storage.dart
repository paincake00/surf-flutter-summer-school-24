import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeStorage {
  final SharedPreferences _sharedPreferences;

  ThemeStorage({required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences;

  Future<void> setThemeMode({
    required ThemeMode mode,
  }) async {
    await _sharedPreferences.setString(
      ThemeStorageKeys.mode.key,
      mode.name,
    );
  }

  ThemeMode? getThemeMode() {
    final mode = _sharedPreferences.getString(ThemeStorageKeys.mode.key);

    if (mode != null) {
      return ThemeMode.values.firstWhereOrNull(
        (themeMode) => themeMode.name == mode,
      );
    }
    return null;
  }
}

enum ThemeStorageKeys {
  mode('theme_mode');

  final String key;

  const ThemeStorageKeys(this.key);
}
