import 'dart:developer';

import 'package:example/src/components/base_component.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class ButtonsWidgets extends StatelessWidget {
  const ButtonsWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseComponent(
      title: 'Buttons',
      child: Column(
        children: [
          OverflowBar(
            spacing: 12,
            overflowSpacing: 12,
            alignment: MainAxisAlignment.center,
            overflowAlignment: OverflowBarAlignment.center,
            children: <Widget>[
              UiButton(
                text: 'Primary',
                onTap: () {},
              ),
              UiButton.destructive(
                text: 'Destructive',
                onTap: () {},
              ),
              UiButton.outlined(
                text: 'Outlined',
                onTap: () {},
              ),
              UiButton.secondary(
                text: 'Secondary',
                onTap: () {},
              ),
              UiButton.text(
                text: 'Text',
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(height: 20),
          OverflowBar(
            spacing: 12,
            overflowSpacing: 12,
            alignment: MainAxisAlignment.center,
            overflowAlignment: OverflowBarAlignment.center,
            children: <Widget>[
              UiButton(
                text: 'Prefix icon',
                prefixIcon: Icons.circle_outlined,
                onTap: () {},
              ),
              UiButton(
                text: 'sufix Icon',
                suffixIcon: Icons.circle_outlined,
                onTap: () {},
              ),
              UiButton(
                text: 'icons',
                prefixIcon: Icons.circle_outlined,
                suffixIcon: Icons.circle_outlined,
                onTap: () {},
              ),
              UiButton(
                text: 'Press Loader',
                onTap: () async {
                  log('Pressed Loader wait 3 seconds');
                  await Future.delayed(const Duration(seconds: 3));
                },
              ),
              const UiButton(
                text: 'Disabled',
                disable: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
