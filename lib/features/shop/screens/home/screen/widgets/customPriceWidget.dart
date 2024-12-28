import 'package:flutter/material.dart';

class customPrice extends StatelessWidget {
  const customPrice({
    super.key,
    this.currencySign = '\$',
    this.maxLine = 1,
    this.isLarge = false,
    this.lineThrough = false,
    required this.price,
  });
  final String currencySign;
  final int maxLine, price;
  final bool isLarge;
  final bool lineThrough;
  @override
  Widget build(BuildContext context) {
    return Text(
      currencySign + price.toString(),
      overflow: TextOverflow.ellipsis,
      maxLines: maxLine,
      style: isLarge
          ? Theme.of(context).textTheme.headlineMedium!.apply(
              decoration: lineThrough ? TextDecoration.lineThrough : null)
          : Theme.of(context).textTheme.titleLarge!.apply(
              decoration: lineThrough ? TextDecoration.lineThrough : null),
    );
  }
}
