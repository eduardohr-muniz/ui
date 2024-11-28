import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class ColorWidget extends StatelessWidget {
  final Color color;
  final String name;

  const ColorWidget({
    super.key,
    required this.color,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(8), border: Border.all(color: context.colors.muted)),
        ),
        Text(name)
      ],
    );
  }
}
