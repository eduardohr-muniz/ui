import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui/src/theme/ui_color_scheme_extension.dart';
import 'package:ui/src/theme/ui_colors_scheme.dart';

class UiTheme {
  final ThemeData light;
  final ThemeData dark;

  UiTheme._({required this.light, required this.dark});

  factory UiTheme.primary() {
    final colorScheme = UiColorsScheme.primary();

    return UiTheme._(
      light: _buildThemeFormUiColorScheme(colorScheme.light),
      dark: _buildThemeFormUiColorScheme(colorScheme.dark),
    );
  }

  factory UiTheme.halloween() {
    final colorScheme = UiColorsScheme.orange();

    return UiTheme._(
      light: _buildThemeFormUiColorScheme(
        colorScheme.light,
        fontFamily: GoogleFonts.emilysCandy().fontFamily,
      ),
      dark: _buildThemeFormUiColorScheme(
        colorScheme.dark,
        fontFamily: GoogleFonts.emilysCandy().fontFamily,
      ),
    );
  }

  static ThemeData _buildThemeFormUiColorScheme(UiColorSchemeExtension colorScheme, {String? fontFamily}) {
    return ThemeData(
      useMaterial3: true,
      fontFamily: fontFamily,
      scaffoldBackgroundColor: colorScheme.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.appBar,
        surfaceTintColor: colorScheme.appBar,
        foregroundColor: colorScheme.onAppBar,
      ),
      dialogTheme: DialogTheme(
        backgroundColor: colorScheme.card,
        surfaceTintColor: colorScheme.card,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      extensions: [colorScheme],
      colorScheme: ColorScheme.fromSeed(seedColor: colorScheme.primary, brightness: colorScheme.brightness),
    );
  }
}
