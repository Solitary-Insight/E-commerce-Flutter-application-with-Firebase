import 'package:flutter/material.dart';

import '../../../utils/constants/enums.dart';

class customBrandText extends StatelessWidget {
  const customBrandText({
    super.key,
    required this.title,
    required this.color,
    required this.maxLines,
    required this.textAlign,
    required this.brandTextSize,
  });

  final String title;
  final Color? color;
  final int maxLines;
  final TextAlign textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Text("Nike",
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: brandTextSize == TextSizes.small
              ? Theme.of(context).textTheme.labelMedium!.apply(color: color)
              : brandTextSize == TextSizes.medium
                  ? Theme.of(context).textTheme.bodyLarge!.apply(color: color)
                  : brandTextSize == TextSizes.large
                      ? Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .apply(color: color)
                      : Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(color: color)),
    );
  }
}
