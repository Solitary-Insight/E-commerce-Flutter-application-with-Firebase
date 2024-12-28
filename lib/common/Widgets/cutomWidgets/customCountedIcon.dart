import 'package:flutter/material.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../utils/constants/colors.dart';

class customCountedIcon extends StatelessWidget {
  const customCountedIcon({
    super.key,
    this.iconColor,
    required this.onPressed,
    required this.icon,
    this.count = 0,
  });
  final Color? iconColor;
  final VoidCallback onPressed;
  final IconData icon;
  final int? count;
  @override
  Widget build(BuildContext context) {
    var dark = THelperFunctions.isDarkMode(context);
    return Stack(children: [
      IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: iconColor ?? (dark
                  ? TColors.light
                  : TColors.dark),
        ),
      ),
      Positioned(
        right: 0,
        top: 0,
        child: Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
              color: dark
                  ? TColors.light.withOpacity(0.5)
                  : TColors.black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(100)),
          child: Center(
            child: Text(
              count.toString(),
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .apply(color: TColors.white, fontSizeFactor: 0.8),
            ),
          ),
        ),
      )
    ]);
  }
}
