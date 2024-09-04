import 'package:example/src/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return UiThemeProvider.builder(
      context,
      themeController: UiThemeController(context, theme: UiTheme.primary(), themeMode: ThemeMode.light),
      builder: (theme) => MaterialApp(
        title: 'Flutter Demo',
        theme: theme.light,
        darkTheme: theme.dark,
        themeMode: theme.themeMode,
        home: const HomePage(),
      ),
    );
  }
}
