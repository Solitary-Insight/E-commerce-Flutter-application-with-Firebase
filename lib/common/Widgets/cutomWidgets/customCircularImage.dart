import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';

class customCircularImage extends StatelessWidget {
  const customCircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.color,
    this.backgroundColor,
    required this.imageUrl,
    this.isNetworkImage = false,
    this.fit = BoxFit.cover,
    this.padding = TSizes.sm,
  });
  final double width, height, padding;
  final Color? color;
  final Color? backgroundColor;
  final String imageUrl;
  final bool isNetworkImage;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    bool dark = THelperFunctions.isDarkMode(context);

    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ?? (dark ? TColors.dark : TColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
          child: Image(
            fit: fit,
            image: isNetworkImage
                ? NetworkImage(imageUrl)
                : AssetImage(imageUrl) as ImageProvider,
            // color: color == null ? (dark ? TColors.dark : TColors.white) : color,
          ),
        ),
      ),
    );
  }
}
