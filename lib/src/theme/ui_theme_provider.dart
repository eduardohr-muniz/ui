import 'package:flutter/material.dart';
import 'package:ui/src/providers/providers_export.dart';
import 'package:ui/src/theme/ui_theme_controller.dart';
import 'package:ui/ui.dart';

UiThemeController? _themeControlller;

class UiThemeProvider {
  static final UiThemeProvider _instance = UiThemeProvider._singleton();
  UiThemeProvider._singleton();
  factory UiThemeProvider() => _instance;

  UiThemeController get themeController => _themeControlller!;

  Widget builder(
    BuildContext context, {
    required UiThemeController themeController,
    required Widget Function(UiThemeController theme) builder,
  }) {
    _themeControlller ??= themeController;

    return ListenableBuilder(
      listenable: _themeControlller!,
      builder: (context, chlid) => builder.call(_themeControlller!),
    );
  }
}
