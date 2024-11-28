import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class UiCard extends StatelessWidget {
  final Widget child;
  const UiCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.card,
        border: Border.all(color: context.colors.border),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: child,
      ),
    );
  }
}
