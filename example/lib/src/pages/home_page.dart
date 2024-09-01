import 'package:example/src/components/buttons_widgets.dart';
import 'package:example/src/components/theme_widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demonstration ui'),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              ThemeWidgets(),
              ButtonsWidgets(),
            ],
          ),
        ),
      ),
    );
  }
}
