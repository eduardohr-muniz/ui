import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

enum UiButtonStyle { primary, secondary, destructive, outlined, text }

class _UiButtonStyle {
  final Color backgroundColor;
  final Color onHoverColor;
  final Color textColor;
  final Color? borderColor;

  _UiButtonStyle({
    required this.backgroundColor,
    required this.onHoverColor,
    required this.textColor,
    this.borderColor,
  });

  factory _UiButtonStyle.primary(UiColorSchemeExtension colors) {
    return _UiButtonStyle(
      backgroundColor: colors.primary,
      textColor: colors.onPrimary,
      borderColor: null,
      onHoverColor: colors.primary.withOpacity(0.8),
    );
  }

  factory _UiButtonStyle.secondary(UiColorSchemeExtension colors, ThemeMode themeMode) {
    final isDarkMode = themeMode == ThemeMode.dark;
    return _UiButtonStyle(
      backgroundColor: Colors.grey.shade800,
      textColor: Colors.white,
      borderColor: null,
      onHoverColor: isDarkMode ? colors.muted : colors.secondary.withOpacity(0.8),
    );
  }

  factory _UiButtonStyle.destructive(UiColorSchemeExtension colors, {required ThemeMode themeMode}) {
    return _UiButtonStyle(
      backgroundColor: colors.destructive,
      textColor: colors.onDestructive,
      borderColor: null,
      onHoverColor: colors.destructive.withOpacity(0.8),
    );
  }

  factory _UiButtonStyle.outlined(UiColorSchemeExtension colors, {required ThemeMode themeMode}) {
    final isDarkMode = themeMode == ThemeMode.dark;
    return _UiButtonStyle(
      backgroundColor: Colors.transparent,
      textColor: colors.onBackground,
      borderColor: colors.border,
      onHoverColor: isDarkMode ? colors.muted.withOpacity(0.8) : colors.secondary.withOpacity(0.8),
    );
  }

  factory _UiButtonStyle.text(UiColorSchemeExtension colors, {required ThemeMode themeMode}) {
    return _UiButtonStyle(
      backgroundColor: Colors.transparent,
      textColor: colors.onBackground,
      borderColor: null,
      onHoverColor: colors.primary.withOpacity(0.1),
    );
  }
}

class UiButton extends StatefulWidget {
  final String text;
  final FutureOr<void> Function()? onTap;
  final FutureOr<void> Function()? onDoubleTap;
  final FutureOr<void> Function()? onSecondaryTap;
  final FutureOr<void> Function()? onLongPress;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool disable;
  final UiButtonStyle style;

  const UiButton({
    super.key,
    required this.text,
    this.onTap,
    this.prefixIcon,
    this.suffixIcon,
    this.disable = false,
    this.onDoubleTap,
    this.onSecondaryTap,
    this.onLongPress,
  }) : style = UiButtonStyle.primary;

  const UiButton.secondary({
    super.key,
    required this.text,
    this.onTap,
    this.disable = false,
    this.prefixIcon,
    this.suffixIcon,
    this.onDoubleTap,
    this.onSecondaryTap,
    this.onLongPress,
  }) : style = UiButtonStyle.secondary;

  const UiButton.destructive({
    super.key,
    required this.text,
    this.onTap,
    this.disable = false,
    this.prefixIcon,
    this.suffixIcon,
    this.onDoubleTap,
    this.onSecondaryTap,
    this.onLongPress,
  }) : style = UiButtonStyle.destructive;

  const UiButton.outlined({
    super.key,
    required this.text,
    this.onTap,
    this.disable = false,
    this.prefixIcon,
    this.suffixIcon,
    this.onDoubleTap,
    this.onSecondaryTap,
    this.onLongPress,
  }) : style = UiButtonStyle.outlined;

  const UiButton.text({
    super.key,
    required this.text,
    this.onTap,
    this.disable = false,
    this.prefixIcon,
    this.suffixIcon,
    this.onDoubleTap,
    this.onSecondaryTap,
    this.onLongPress,
  }) : style = UiButtonStyle.text;

  @override
  State<UiButton> createState() => _UiButtonState();
}

class _UiButtonState extends State<UiButton> {
  ThemeMode get themeMode => Theme.of(context).brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
  UiColorSchemeExtension get colors => context.colors;

  _UiButtonStyle get style => switch (widget.style) {
        UiButtonStyle.primary => _UiButtonStyle.primary(colors),
        UiButtonStyle.secondary => _UiButtonStyle.secondary(colors, themeMode),
        UiButtonStyle.destructive => _UiButtonStyle.destructive(colors, themeMode: themeMode),
        UiButtonStyle.outlined => _UiButtonStyle.outlined(colors, themeMode: themeMode),
        _ => _UiButtonStyle.text(colors, themeMode: themeMode),
      };

  bool _isLoad = false;
  final _borderradius = BorderRadius.circular(10);

  Future<void> _callFunction(FutureOr<void> Function()? func) async {
    if (widget.disable || _isLoad) return;
    if (func != null) {
      setState(() {
        _isLoad = true;
      });
      await func.call();
      setState(() {
        _isLoad = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final child = Material(
      color: style.backgroundColor,
      borderRadius: _borderradius,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      type: MaterialType.button,
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 45),
        child: InkWell(
          hoverColor: style.onHoverColor,
          onDoubleTap: widget.onDoubleTap == null || _isLoad ? null : () async => await _callFunction(widget.onDoubleTap),
          onTap: widget.onTap == null || _isLoad ? null : () async => await _callFunction(widget.onTap),
          onSecondaryTap: widget.onSecondaryTap == null || _isLoad ? null : () async => await _callFunction(widget.onSecondaryTap),
          onLongPress: widget.onLongPress == null || _isLoad ? null : () async => await _callFunction(widget.onLongPress),
          child: Ink(
            decoration: style.borderColor == null
                ? null
                : BoxDecoration(
                    borderRadius: _borderradius,
                    border: Border.all(color: style.borderColor ?? Colors.transparent),
                  ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: VisibilityProgressIndicator(
                visibility: _isLoad,
                color: style.textColor,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (widget.prefixIcon != null)
                      Padding(padding: const EdgeInsets.only(right: 8), child: Icon(widget.prefixIcon, color: style.textColor)),
                    Text(
                      widget.text,
                      style: context.textTheme.bodyLarge?.copyWith(color: style.textColor, fontWeight: FontWeight.w700),
                    ),
                    if (widget.suffixIcon != null)
                      Padding(padding: const EdgeInsets.only(left: 8), child: Icon(widget.suffixIcon, color: style.textColor)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
    if (widget.disable) {
      return Material(
        borderRadius: _borderradius,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: ColorFiltered(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(themeMode == ThemeMode.dark ? 0.4 : 0.2),
              BlendMode.darken,
            ),
            child: child),
      );
    }
    return child;
  }
}
