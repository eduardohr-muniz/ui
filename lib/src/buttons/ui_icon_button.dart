import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class UiIconButton extends StatefulWidget {
  final IconData icon;
  final FutureOr<void> Function()? onTap;
  final FutureOr<void> Function()? onDoubleTap;
  final FutureOr<void> Function()? onSecondaryTap;
  final FutureOr<void> Function()? onLongPress;
  final bool disable;
  final UiButtonStyleEnum style;
  final double size;

  const UiIconButton({
    super.key,
    required this.icon,
    this.onTap,
    this.onDoubleTap,
    this.onSecondaryTap,
    this.onLongPress,
    this.disable = false,
    this.size = 24.0,
    this.style = UiButtonStyleEnum.primary,
  });

  const UiIconButton.secondary({
    super.key,
    required this.icon,
    this.onTap,
    this.onDoubleTap,
    this.onSecondaryTap,
    this.onLongPress,
    this.disable = false,
    this.size = 24.0,
  }) : style = UiButtonStyleEnum.secondary;

  const UiIconButton.destructive({
    super.key,
    required this.icon,
    this.onTap,
    this.onDoubleTap,
    this.onSecondaryTap,
    this.onLongPress,
    this.disable = false,
    this.size = 24.0,
  }) : style = UiButtonStyleEnum.destructive;

  const UiIconButton.outlined({
    super.key,
    required this.icon,
    this.onTap,
    this.onDoubleTap,
    this.onSecondaryTap,
    this.onLongPress,
    this.disable = false,
    this.size = 24.0,
  }) : style = UiButtonStyleEnum.outlined;

  const UiIconButton.icon({
    super.key,
    required this.icon,
    this.onTap,
    this.onDoubleTap,
    this.onSecondaryTap,
    this.onLongPress,
    this.disable = false,
    this.size = 24.0,
  }) : style = UiButtonStyleEnum.text;

  @override
  State<UiIconButton> createState() => _UiIconButtonState();
}

class _UiIconButtonState extends State<UiIconButton> {
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
  final _borderRadius = BorderRadius.circular(8);

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
      borderRadius: _borderRadius,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      type: MaterialType.button,
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
                  borderRadius: _borderRadius,
                  border: Border.all(color: style.borderColor ?? Colors.transparent, width: 1.5),
                ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: VisibilityProgressIndicator(
              visibility: _isLoad,
              color: style.onBackgorundColor,
              child: Icon(
                widget.icon,
                color: style.onBackgorundColor,
                size: widget.size,
              ),
            ),
          ),
        ),
      ),
    );

    if (widget.disable) {
      return Material(
        borderRadius: _borderRadius,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(themeMode == ThemeMode.dark ? 0.4 : 0.2),
            BlendMode.darken,
          ),
          child: child,
        ),
      );
    }

    return child;
  }
}
