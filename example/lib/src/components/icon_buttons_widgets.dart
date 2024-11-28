import 'dart:developer';

import 'package:example/src/components/base_component.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class IconButtonsWidgets extends StatelessWidget {
  const IconButtonsWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseComponent(
      title: 'Icon Buttons',
      child: Column(
        children: [
          OverflowBar(
            spacing: 12,
            overflowSpacing: 12,
            alignment: MainAxisAlignment.center,
            overflowAlignment: OverflowBarAlignment.center,
            children: <Widget>[
              UiIconButton(
                icon: Icons.circle_outlined,
                onTap: () async => await _tapFuture(),
              ),
              UiIconButton.destructive(
                icon: Icons.circle_outlined,
                onTap: () async => await _tapFuture(),
              ),
              UiIconButton.outlined(
                icon: Icons.circle_outlined,
                onTap: () async => await _tapFuture(),
              ),
              UiIconButton.secondary(
                icon: Icons.circle_outlined,
                onTap: () async => await _tapFuture(),
              ),
              UiIconButton.icon(
                icon: Icons.circle_outlined,
                onTap: () async => await _tapFuture(),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Future<void> _tapFuture() async {
    log('await 3 seconds');
    await Future.delayed(const Duration(seconds: 3));
    log('done');
  }
}
