import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class customVerticalImageTextWidget extends StatelessWidget {
  const customVerticalImageTextWidget({
    super.key,
    required this.text,
    required this.image,
    this.textColor = TColors.white,
    this.backgroundColor,
    required this.onPressed,
  });
  final String text;
  final ImageProvider image;
  final Color? textColor;
  final Color? backgroundColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);

    return InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
          child: Column(
            children: [
              Container(
                height: 56,
                width: 56,
                padding: const EdgeInsets.all(TSizes.sm),
                decoration: BoxDecoration(
                    color: backgroundColor ??
                        (dark ? TColors.black : TColors.white),
                    borderRadius: BorderRadius.circular(100)),
                child: Center(
                  child: Image(
                    image: image,
                    fit: BoxFit.cover,
                    color: backgroundColor ??
                        (dark ? TColors.light : TColors.dark),
                  ),
                ),
              ),
              Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                text,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
              )
            ],
          ),
        ));
  }
}
