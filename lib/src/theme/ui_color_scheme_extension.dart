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
  final Color onMuted;
  final Color card;
  final Color onCard;
  final Color popover;
  final Color onPopover;
  final Color border;
  final Color input;
  final Color primary;
  final Color onPrimary;
  final Color secondary;
  final Color onSecondary;
  final Color accent;
  final Color onAccent;
  final Color destructive;
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
    required this.onMuted,
    required this.card,
    required this.onCard,
    required this.popover,
    required this.onPopover,
    required this.border,
    required this.input,
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
    required this.accent,
    required this.onAccent,
    required this.destructive,
    required this.onDestructive,
  });

  @override
  ThemeExtension<UiColorSchemeExtension> lerp(covariant ThemeExtension<UiColorSchemeExtension>? other, double t) {
    if (other is! UiColorSchemeExtension) return this;
    return UiColorSchemeExtension(
      background: Color.lerp(background, other.background, t)!,
      onBackground: Color.lerp(onBackground, other.onBackground, t)!,
      surface: Color.lerp(surface, other.background, t)!,
      onSurface: Color.lerp(onSurface, other.onBackground, t)!,
      appBar: Color.lerp(appBar, other.appBar, t)!,
      onAppBar: Color.lerp(onAppBar, other.onAppBar, t)!,
      muted: Color.lerp(muted, other.muted, t)!,
      onMuted: Color.lerp(onMuted, other.onMuted, t)!,
      card: Color.lerp(card, other.card, t)!,
      onCard: Color.lerp(onCard, other.onCard, t)!,
      popover: Color.lerp(popover, other.popover, t)!,
      onPopover: Color.lerp(onPopover, other.onPopover, t)!,
      border: Color.lerp(border, other.border, t)!,
      input: Color.lerp(input, other.input, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      onSecondary: Color.lerp(onSecondary, other.onSecondary, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      onAccent: Color.lerp(onAccent, other.onAccent, t)!,
      destructive: Color.lerp(destructive, other.destructive, t)!,
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
    Color? onMuted,
    Color? card,
    Color? onCard,
    Color? popover,
    Color? onPopover,
    Color? border,
    Color? input,
    Color? primary,
    Color? onPrimary,
    Color? secondary,
    Color? onSecondary,
    Color? accent,
    Color? onAccent,
    Color? destructive,
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
      onMuted: onMuted ?? this.onMuted,
      card: card ?? this.card,
      onCard: onCard ?? this.onCard,
      popover: popover ?? this.popover,
      onPopover: onPopover ?? this.onPopover,
      border: border ?? this.border,
      input: input ?? this.input,
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      secondary: secondary ?? this.secondary,
      onSecondary: onSecondary ?? this.onSecondary,
      accent: accent ?? this.accent,
      onAccent: onAccent ?? this.onAccent,
      destructive: destructive ?? this.destructive,
      onDestructive: onDestructive ?? this.onDestructive,
    );
  }
}
