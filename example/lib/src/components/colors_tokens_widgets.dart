import 'package:example/src/components/base_component.dart';
import 'package:example/src/components/color_widget.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class ColorsTokensWidgets extends StatelessWidget {
  const ColorsTokensWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseComponent(
      title: 'Colors',
      child: Wrap(
        spacing: 20,
        runSpacing: 20,
        children: [
          ColorWidget(color: context.colors.background, name: 'Background'),
          ColorWidget(color: context.colors.onBackground, name: 'On Background'),
          ColorWidget(color: context.colors.surface, name: 'Surface'),
          ColorWidget(color: context.colors.onSurface, name: 'On Surface'),
          ColorWidget(color: context.colors.appBar, name: 'App Bar'),
          ColorWidget(color: context.colors.onAppBar, name: 'On App Bar'),
          ColorWidget(color: context.colors.muted, name: 'Muted'),
          ColorWidget(color: context.colors.card, name: 'Card'),
          ColorWidget(color: context.colors.border, name: 'Border'),
          ColorWidget(color: context.colors.input, name: 'Input'),
          ColorWidget(color: context.colors.primary400, name: 'Primary 400'),
          ColorWidget(color: context.colors.primary, name: 'Primary'),
          ColorWidget(color: context.colors.primary600, name: 'Primary 600'),
          ColorWidget(color: context.colors.onPrimary, name: 'On Primary'),
          ColorWidget(color: context.colors.secondary400, name: 'Secondary 400'),
          ColorWidget(color: context.colors.secondary, name: 'Secondary'),
          ColorWidget(color: context.colors.secondary600, name: 'Secondary 600'),
          ColorWidget(color: context.colors.onSecondary, name: 'On Secondary'),
          ColorWidget(color: context.colors.destructive400, name: 'Destructive 400'),
          ColorWidget(color: context.colors.destructive, name: 'Destructive'),
          ColorWidget(color: context.colors.destructive600, name: 'Destructive 600'),
          ColorWidget(color: context.colors.onDestructive, name: 'On Destructive'),
        ],
      ),
    );
  }
}
