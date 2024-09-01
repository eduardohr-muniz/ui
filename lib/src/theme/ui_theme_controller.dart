import 'package:flutter/material.dart';
import 'package:ui/src/providers/providers_export.dart';
import 'package:ui/src/theme/ui_theme_export.dart';

class UiThemeController extends ChangeNotifier {
  final BuildContext _context;
  UiTheme _currentTheme;
  ThemeMode _themeMode;

  UiThemeController(
    BuildContext context, {
    required UiTheme theme,
    ThemeMode? themeMode,
  })  : _currentTheme = theme,
        _themeMode = themeMode ?? ThemeMode.system,
        _context = context;

  UiColorSchemeExtension get colors {
    if (_themeMode == ThemeMode.system) {
      bool isDark = MediaQuery.platformBrightnessOf(_context) == Brightness.dark;
      return isDark ? _currentTheme.dark.extension<UiColorSchemeExtension>()! : _currentTheme.light.extension<UiColorSchemeExtension>()!;
    }
    return _themeMode == ThemeMode.dark
        ? _currentTheme.dark.extension<UiColorSchemeExtension>()!
        : _currentTheme.light.extension<UiColorSchemeExtension>()!;
  }

  bool get isDark => _themeMode == ThemeMode.dark;

  ThemeData get light => _currentTheme.light;

  ThemeData get dark => _currentTheme.dark;

  ThemeMode get themeMode => _themeMode;

  void toggleTheme(UiTheme theme) {
    _currentTheme = theme;
    notifyListeners();
  }

  void setThemeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }

  void toggleThemeMode() {
    _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

extension ThemeNotifierContext on BuildContext {
  UiThemeController get themeController => UiThemeProvider().themeController;
  UiColorSchemeExtension get colors => Theme.of(this).extension<UiColorSchemeExtension>() ?? themeController.colors;
  ThemeMode get themeMode => themeController.themeMode;
  TextTheme get textTheme => Theme.of(this).textTheme;
  bool get isDark => Theme.of(this).brightness == Brightness.dark;
  bool get isLight => !isDark;
}
