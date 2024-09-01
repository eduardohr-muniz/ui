import 'package:flutter/material.dart';
import 'package:ui/src/theme/ui_color_scheme_extension.dart';

class UiColorsScheme {
  UiColorSchemeExtension light;
  UiColorSchemeExtension dark;

  UiColorsScheme({
    required this.light,
    required this.dark,
  });

  static const UiColorSchemeExtension colorSchemePrimaryLight = UiColorSchemeExtension(
    brightness: Brightness.light,
    background: Colors.white,
    onBackground: Colors.black,
    surface: Color(0xffF3F0FF),
    onSurface: Colors.black,
    appBar: Color(0xffF3F0FF),
    onAppBar: Colors.black,
    muted: Color(0xffE6E0FF),
    onMuted: Color(0xffCEC2FF),
    card: Color(0xffF3F0FF),
    onCard: Colors.black,
    popover: Color(0xffF3F0FF),
    onPopover: Colors.black,
    border: Color(0xffCEC2FF),
    input: Color(0xffF4F4F5),
    primary: Colors.blue,
    onPrimary: Colors.white,
    secondary: Color(0xffE4E4E7),
    onSecondary: Color(0xff71717a),
    accent: Color(0xffD63C3C),
    onAccent: Color(0xffF3F0FF),
    destructive: Colors.red,
    onDestructive: Colors.white,
  );

  static const UiColorSchemeExtension colorSchemePrimaryDark = UiColorSchemeExtension(
    brightness: Brightness.dark,
    background: Color(0xff18181b),
    onBackground: Colors.white,
    appBar: Color(0xff27272a),
    onAppBar: Colors.white,
    surface: Colors.black,
    onSurface: Colors.white,
    muted: Color(0xff27272a),
    onMuted: Color(0xff3f3f46),
    card: Color(0xff27272a),
    onCard: Colors.white,
    popover: Color(0xff27272a),
    onPopover: Colors.white,
    border: Color(0xff3f3f46),
    input: Color(0xff27272a),
    primary: Colors.lightBlue,
    onPrimary: Colors.white,
    secondary: Color(0xffd4d4d8),
    onSecondary: Color(0xff71717a),
    accent: Color(0xffD63C3C),
    onAccent: Colors.white,
    destructive: Colors.redAccent,
    onDestructive: Colors.white,
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
          onPrimary: Colors.white,
          appBar: const Color(0xff27272a),
          primary: Colors.deepPurple,
          onAppBar: const Color.fromARGB(255, 109, 225, 1),
          onBackground: Colors.white,
          onSurface: Colors.white),
    );
  }
}
