import 'package:flutter/material.dart';

class MyThemeManager extends ChangeNotifier {
  ThemeMode _currentTheme = ThemeMode.light;

  ThemeMode get themeMode => _currentTheme;

  void toggleTheme() {
    _currentTheme =
        _currentTheme == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
