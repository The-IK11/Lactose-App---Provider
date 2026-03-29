import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  var _themeMode = ThemeMode.light;
  
  // Store selected color for each theme mode
  Color _lightModeColor = Colors.deepPurple;
  Color _darkModeColor = Colors.teal;
  Color _systemModeColor = Colors.amber;
  
  ThemeMode get themeMode => _themeMode;
  
  Color get selectedColor {
    switch (_themeMode) {
      case ThemeMode.light:
        return _lightModeColor;
      case ThemeMode.dark:
        return _darkModeColor;
      case ThemeMode.system:
        return _systemModeColor;
    }
  }

  void toggleTheme(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }
  
  void setLightModeColor(Color color) {
    _lightModeColor = color;
    if (_themeMode == ThemeMode.light) notifyListeners();
  }
  
  void setDarkModeColor(Color color) {
    _darkModeColor = color;
    if (_themeMode == ThemeMode.dark) notifyListeners();
  }
  
  void setSystemModeColor(Color color) {
    _systemModeColor = color;
    if (_themeMode == ThemeMode.system) notifyListeners();
  }

}