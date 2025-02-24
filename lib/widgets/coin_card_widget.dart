import 'package:flutter/material.dart';
import 'package:test_api/widgets/color_box_widget.dart';
import 'package:test_api/widgets/price_widget.dart';

class CoinCardWidget extends StatelessWidget {
  const CoinCardWidget({
    super.key,
    required this.price,
    required this.color,
    required this.description,
    required this.symbol,
  });
  final String price;
  final Color color;
  final String description;
  final String symbol;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 84,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ColorBoxWidget(color: color, description: description),
            PriceWidget(price: price, symbol: symbol),
          ],
        ),
      ),
    );
  }
}
