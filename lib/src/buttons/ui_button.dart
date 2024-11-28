import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

enum UiButtonStyleEnum { primary, secondary, destructive, outlined, text }

class UiButtonStyle {
  final Color backgroundColor;
  final Color onHoverColor;
  final Color onBackgorundColor;
  final Color? borderColor;

  UiButtonStyle({
    required this.backgroundColor,
    required this.onHoverColor,
    required this.onBackgorundColor,
    this.borderColor,
  });

  factory UiButtonStyle.primary(UiColorSchemeExtension colors) {
    return UiButtonStyle(
      backgroundColor: colors.primary,
      onBackgorundColor: colors.onPrimary,
      borderColor: null,
      onHoverColor: colors.primary600,
    );
  }

  factory UiButtonStyle.secondary(UiColorSchemeExtension colors, ThemeMode themeMode) {
    return UiButtonStyle(
      backgroundColor: colors.secondary,
      onBackgorundColor: colors.onSecondary,
      borderColor: null,
      onHoverColor: colors.secondary600,
    );
  }

  factory UiButtonStyle.destructive(UiColorSchemeExtension colors, {required ThemeMode themeMode}) {
    return UiButtonStyle(
      backgroundColor: colors.destructive,
      onBackgorundColor: colors.onDestructive,
      borderColor: null,
      onHoverColor: colors.destructive600,
    );
  }

  factory UiButtonStyle.outlined(UiColorSchemeExtension colors, {required ThemeMode themeMode}) {
    final isDarkMode = themeMode == ThemeMode.dark;
    return UiButtonStyle(
      backgroundColor: Colors.transparent,
      onBackgorundColor: colors.onBackground,
      borderColor: colors.border,
      onHoverColor: isDarkMode ? colors.muted.withOpacity(0.8) : colors.secondary.withOpacity(0.8),
    );
  }

  factory UiButtonStyle.text(UiColorSchemeExtension colors, {required ThemeMode themeMode}) {
    return UiButtonStyle(
      backgroundColor: Colors.transparent,
      onBackgorundColor: colors.onBackground,
      borderColor: null,
      onHoverColor: colors.onBackground.withOpacity(0.1),
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
  final UiButtonStyleEnum style;

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
  }) : style = UiButtonStyleEnum.primary;

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
  }) : style = UiButtonStyleEnum.secondary;

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
  }) : style = UiButtonStyleEnum.destructive;

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
  }) : style = UiButtonStyleEnum.outlined;

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
  }) : style = UiButtonStyleEnum.text;

  @override
  State<UiButton> createState() => _UiButtonState();
}

class _UiButtonState extends State<UiButton> {
  ThemeMode get themeMode => Theme.of(context).brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
  UiColorSchemeExtension get colors => context.colors;

  UiButtonStyle get style => switch (widget.style) {
        UiButtonStyleEnum.primary => UiButtonStyle.primary(colors),
        UiButtonStyleEnum.secondary => UiButtonStyle.secondary(colors, themeMode),
        UiButtonStyleEnum.destructive => UiButtonStyle.destructive(colors, themeMode: themeMode),
        UiButtonStyleEnum.outlined => UiButtonStyle.outlined(colors, themeMode: themeMode),
        _ => UiButtonStyle.text(colors, themeMode: themeMode),
      };

  bool _isLoad = false;
  final _borderradius = BorderRadius.circular(8);

  Future<void> _callFunction(FutureOr<void> Function()? func) async {
    if (widget.disable || _isLoad) return;
    if (func == null) return;

    if (func is! Future<void> Function()) return func.call();

    setState(() {
      _isLoad = true;
    });
    await func.call();
    setState(() {
      _isLoad = false;
    });
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
                    border: Border.all(color: style.borderColor ?? Colors.transparent, width: 1.5),
                  ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: VisibilityProgressIndicator(
                visibility: _isLoad,
                color: style.onBackgorundColor,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (widget.prefixIcon != null)
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Icon(
                          widget.prefixIcon,
                          color: style.onBackgorundColor,
                          size: 18,
                        ),
                      ),
                    Text(
                      widget.text,
                      style: context.textTheme.bodyLarge?.copyWith(color: style.onBackgorundColor, fontWeight: FontWeight.w500),
                    ),
                    if (widget.suffixIcon != null)
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Icon(
                          widget.suffixIcon,
                          color: style.onBackgorundColor,
                          size: 18,
                        ),
                      ),
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
