import 'package:flutter/material.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({super.key, required this.price, required this.symbol});
  final String price;
  final String symbol;

  @override
  Widget build(BuildContext context) {
    return Text(
      symbol + price,
      style: const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: Color(0xff17171A),
        letterSpacing: -0.41,
      ),
    );
  }
}
