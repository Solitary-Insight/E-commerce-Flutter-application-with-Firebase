import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';

class customCircularIcon extends StatelessWidget {
  const customCircularIcon({
    super.key,
    required this.icon,
    this.onPressed,
    this.height,
    this.width,
    this.iconSize = TSizes.lg,
    this.color,
    this.backgroundColor,
  });
  final IconData icon;
  final VoidCallback? onPressed;
  final double? iconSize;
  final double? height, width;
  final Color? color;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    var darkMode = THelperFunctions.isDarkMode(context);

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: backgroundColor ??
            (darkMode
                ? TColors.black.withOpacity(0.9)
                : TColors.white.withOpacity(0.9)),
      ),
      child: IconButton(
        icon: Icon(
          icon,
          color: color,
          size: iconSize,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
