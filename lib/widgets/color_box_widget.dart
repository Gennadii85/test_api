import 'package:flutter/material.dart';

class ColorBoxWidget extends StatelessWidget {
  const ColorBoxWidget({
    super.key,
    required this.color,
    required this.description,
  });
  final Color color;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: color.withValues(alpha: (0.1 * 255).toDouble()),
          ),
        ),
        const SizedBox(width: 16),
        Text(
          description,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: Color(0xff17171A),
            letterSpacing: -0.41,
          ),
        ),
      ],
    );
  }
}
