import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class BaseComponent extends StatelessWidget {
  final String title;
  final Widget child;

  const BaseComponent({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(alignment: Alignment.topLeft, child: Text(title, style: context.textTheme.displaySmall)),
        const SizedBox(height: 20),
        child,
        const SizedBox(height: 20),
        const Divider(),
      ],
    );
  }
}
