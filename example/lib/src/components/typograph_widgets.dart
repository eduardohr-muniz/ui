import 'package:example/src/components/base_component.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class TypographWidgets extends StatelessWidget {
  const TypographWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseComponent(
      title: 'Typograph',
      child: OverflowBar(
        children: [
          Text('Display Large', style: context.textTheme.displayLarge),
          Text('Display Medium', style: context.textTheme.displayMedium),
          Text('Display Small', style: context.textTheme.displaySmall),
          Text('Headline Large', style: context.textTheme.headlineLarge),
          Text('Headline Medium', style: context.textTheme.headlineMedium),
          Text('Headline Small', style: context.textTheme.headlineSmall),
          Text('Title Large', style: context.textTheme.titleLarge),
          Text('Title Medium', style: context.textTheme.titleMedium),
          Text('Title Small', style: context.textTheme.titleSmall),
          Text('Body Large', style: context.textTheme.bodyLarge),
          Text('Body Medium', style: context.textTheme.bodyMedium),
          Text('Body Small', style: context.textTheme.bodySmall),
          Text('Label Large', style: context.textTheme.labelLarge),
          Text('Label Medium', style: context.textTheme.labelMedium),
          Text('Label Small', style: context.textTheme.labelSmall),
        ],
      ),
    );
  }
}
