import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/utils/constants/enums.dart';

import 'customBrandText.dart';
import '../../../utils/constants/sizes.dart';

class customBrandTitleWithVerification extends StatelessWidget {
  const customBrandTitleWithVerification({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.textColor,
    this.iconColor,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: customBrandText(
            brandTextSize: brandTextSize,
            color: textColor,
            maxLines: maxLines,
            textAlign: textAlign,
            title: title,
          ),
        ),
        const SizedBox(
          height: TSizes.xs,
        ),
        Icon(
          Iconsax.verify5,
          color: iconColor,
          size: TSizes.iconXs,
        )
      ],
    );
  }
}
