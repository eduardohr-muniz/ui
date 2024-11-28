import 'package:flutter/material.dart';

class UiColorSchemeExtension extends ThemeExtension<UiColorSchemeExtension> {
  final Brightness brightness;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color appBar;
  final Color onAppBar;
  final Color muted;
  final Color card;
  final Color border;
  final Color input;
  final Color primary400;
  final Color primary;
  final Color primary600;
  final Color onPrimary;
  final Color secondary400;
  final Color secondary;
  final Color secondary600;
  final Color onSecondary;
  final Color destructive400;
  final Color destructive;
  final Color destructive600;
  final Color onDestructive;

  const UiColorSchemeExtension({
    this.brightness = Brightness.light,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.appBar,
    required this.onAppBar,
    required this.muted,
    required this.card,
    required this.border,
    required this.input,
    required this.primary400,
    required this.primary,
    required this.primary600,
    required this.onPrimary,
    required this.secondary400,
    required this.secondary,
    required this.secondary600,
    required this.onSecondary,
    required this.destructive400,
    required this.destructive,
    required this.destructive600,
    required this.onDestructive,
  });

  @override
  ThemeExtension<UiColorSchemeExtension> lerp(covariant ThemeExtension<UiColorSchemeExtension>? other, double t) {
    if (other is! UiColorSchemeExtension) return this;
    return UiColorSchemeExtension(
      brightness: t < 0.5 ? brightness : other.brightness,
      background: Color.lerp(background, other.background, t)!,
      onBackground: Color.lerp(onBackground, other.onBackground, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
      appBar: Color.lerp(appBar, other.appBar, t)!,
      onAppBar: Color.lerp(onAppBar, other.onAppBar, t)!,
      muted: Color.lerp(muted, other.muted, t)!,
      card: Color.lerp(card, other.card, t)!,
      border: Color.lerp(border, other.border, t)!,
      input: Color.lerp(input, other.input, t)!,
      primary400: Color.lerp(primary400, other.primary400, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      primary600: Color.lerp(primary600, other.primary600, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      secondary400: Color.lerp(secondary400, other.secondary400, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      secondary600: Color.lerp(secondary600, other.secondary600, t)!,
      onSecondary: Color.lerp(onSecondary, other.onSecondary, t)!,
      destructive400: Color.lerp(destructive400, other.destructive400, t)!,
      destructive: Color.lerp(destructive, other.destructive, t)!,
      destructive600: Color.lerp(destructive600, other.destructive600, t)!,
      onDestructive: Color.lerp(onDestructive, other.onDestructive, t)!,
    );
  }

  @override
  UiColorSchemeExtension copyWith({
    Brightness? brightness,
    Color? background,
    Color? onBackground,
    Color? surface,
    Color? onSurface,
    Color? appBar,
    Color? onAppBar,
    Color? muted,
    Color? card,
    Color? border,
    Color? input,
    Color? primary400,
    Color? primary,
    Color? primary600,
    Color? onPrimary,
    Color? secondary400,
    Color? secondary,
    Color? onSecondary600,
    Color? onSecondary,
    Color? destructive400,
    Color? destructive,
    Color? onDestructive600,
    Color? onDestructive,
  }) {
    return UiColorSchemeExtension(
      brightness: brightness ?? this.brightness,
      background: background ?? this.background,
      onBackground: onBackground ?? this.onBackground,
      surface: surface ?? this.surface,
      onSurface: onSurface ?? this.onSurface,
      appBar: appBar ?? this.appBar,
      onAppBar: onAppBar ?? this.onAppBar,
      muted: muted ?? this.muted,
      card: card ?? this.card,
      border: border ?? this.border,
      input: input ?? this.input,
      primary400: primary400 ?? this.primary400,
      primary: primary ?? this.primary,
      primary600: primary600 ?? this.primary600,
      onPrimary: onPrimary ?? this.onPrimary,
      secondary400: secondary400 ?? this.secondary400,
      secondary: secondary ?? this.secondary,
      secondary600: onSecondary600 ?? secondary600,
      onSecondary: onSecondary ?? this.onSecondary,
      destructive400: destructive400 ?? this.destructive400,
      destructive: destructive ?? this.destructive,
      destructive600: onDestructive600 ?? destructive600,
      onDestructive: onDestructive ?? this.onDestructive,
    );
  }
}
