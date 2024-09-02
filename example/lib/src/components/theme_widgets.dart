import 'package:example/src/components/base_component.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class ThemeWidgets extends StatelessWidget {
  const ThemeWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseComponent(
        title: 'Themes',
        child: OverflowBar(
          spacing: 12,
          overflowSpacing: 12,
          alignment: MainAxisAlignment.center,
          overflowAlignment: OverflowBarAlignment.center,
          children: [
            UiButton.outlined(text: 'Set light theme', onTap: () => context.themeController.setThemeMode(ThemeMode.light)),
            UiButton.secondary(text: 'Set Dark theme', onTap: () => context.themeController.setThemeMode(ThemeMode.dark)),
            Theme(
                data: UiTheme.halloween().light,
                child: UiButton(text: 'Set Halloween Theme', onTap: () => context.themeController.toggleTheme(UiTheme.halloween()))),
            Theme(
                data: context.isDark ? UiTheme.primary().dark : UiTheme.primary().light,
                child: UiButton(text: 'Set Primary Theme', onTap: () => context.themeController.toggleTheme(UiTheme.primary()))),
          ],
        ));
  }
}
