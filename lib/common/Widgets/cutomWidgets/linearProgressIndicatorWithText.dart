import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class linearProgressIndicatorWithText extends StatelessWidget {
  const linearProgressIndicatorWithText({
    super.key,
    required this.value,
    this.total = 5,
    this.backgroundColor = TColors.grey,
    this.filledColor = TColors.primary,
  });

  final int value;
  final int total;
  final Color backgroundColor;
  final Color filledColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Text(
              value.toString(),
              style: Theme.of(context).textTheme.bodyMedium,
            )),
        Expanded(
            flex: 11,
            child: LinearProgressIndicator(
                value: value / total,
                minHeight: 5,
                backgroundColor: backgroundColor,
                borderRadius: BorderRadius.circular(7),
                valueColor: AlwaysStoppedAnimation(filledColor)))
      ],
    );
  }
}
