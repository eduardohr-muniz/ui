import 'package:flutter/material.dart';
import 'package:ui/src/theme/ui_color_scheme_extension.dart';

class UiColorsScheme {
  UiColorSchemeExtension light;
  UiColorSchemeExtension dark;

  UiColorsScheme({
    required this.light,
    required this.dark,
  });

  // Definindo os temas claros e escuros baseados na paleta Zinc

  static const UiColorSchemeExtension colorSchemePrimaryLight = UiColorSchemeExtension(
    brightness: Brightness.light,
    background: Color(0xFFFAFAFA),
    onBackground: Color(0xFF18181B),
    surface: Color(0xFFF4F4F5),
    onSurface: Color(0xFF18181B),
    appBar: Color(0xFFF4F4F5),
    onAppBar: Color(0xFF18181B),
    muted: Color(0xFFE4E4E7),
    card: Color(0xFFF4F4F5),
    border: Color(0xFFD4D4D8),
    input: Color(0xFFF4F4F5),
    primary: Color(0xFF18181B),
    primary400: Color(0xFF3F3F46),
    onPrimary: Colors.white,
    primary600: Color(0xFFE4E4E7),
    secondary: Color(0xFFE4E4E7),
    secondary400: Color(0xFFA1A1AA),
    onSecondary: Color(0xFF71717A),
    secondary600: Color(0xFF52525B),
    destructive: Color(0xFFDC2626),
    destructive400: Color(0xFFF87171),
    onDestructive: Colors.white,
    destructive600: Color(0xFFB91C1C),
  );

  static const UiColorSchemeExtension colorSchemePrimaryDark = UiColorSchemeExtension(
    brightness: Brightness.dark,
    background: Color(0xFF18181B),
    onBackground: Color(0xFFF4F4F5),
    appBar: Color(0xFF18181B),
    onAppBar: Color(0xFFF4F4F5),
    surface: Colors.black,
    onSurface: Color(0xFFF4F4F5),
    muted: Color(0xFF3F3F46),
    card: Color(0xFF27272A),
    border: Color(0xFF52525B),
    input: Color(0xFF27272A),
    primary: Color(0xFFF4F4F5),
    primary400: Color(0xFFD4D4D8),
    onPrimary: Color(0xFF18181B),
    primary600: Colors.white,
    secondary: Color(0xFF18181B),
    secondary400: Color(0xFF9CA3AF),
    onSecondary: Color(0xFF9CA3AF),
    secondary600: Color(0xFFA1A1AA),
    destructive: Color(0xFFEF4444),
    destructive400: Color(0xFFF87171),
    onDestructive: Colors.white,
    destructive600: Color(0xFFB91C1C),
  );

  factory UiColorsScheme.primary() {
    return UiColorsScheme(
      light: colorSchemePrimaryLight,
      dark: colorSchemePrimaryDark,
    );
  }

  factory UiColorsScheme.orange() {
    return UiColorsScheme(
      light: colorSchemePrimaryLight.copyWith(
        surface: Colors.orange.shade50,
        primary: Colors.orange,
        onPrimary: Colors.black,
        appBar: Colors.orange,
        onAppBar: Colors.black,
      ),
      dark: colorSchemePrimaryDark.copyWith(
          primary: Colors.orange,
          primary600: Colors.orange.shade600,
          onPrimary: Colors.black,
          onAppBar: Colors.orange,
          destructive: Colors.white,
          destructive400: Colors.white,
          onDestructive600: Colors.white,
          onDestructive: Colors.red),
    );
  }
}
