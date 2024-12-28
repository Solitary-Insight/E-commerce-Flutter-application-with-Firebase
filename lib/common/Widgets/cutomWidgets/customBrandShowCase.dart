import 'package:flutter/cupertino.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../customShapes/containers/customCircularContainer.dart';
import 'customBrandCard.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';

class customBrandShowCase extends StatelessWidget {
  const customBrandShowCase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return customCircularContainer(
      backgroundColor: TColors.transparent,
      showBorder: true,
      borderColor: TColors.darkGrey,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Column(
        children: [
          const customBrandCard(),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          Row(
            children: images
                .map((e) => bradTopProductImageWidget(context, e))
                .toList(),
          )
        ],
      ),
    );
  }
}

Widget bradTopProductImageWidget(BuildContext context, String image) {
  return Expanded(
    child: customCircularContainer(
        padding: const EdgeInsets.all(TSizes.md),
        height: 100,
        margin: const EdgeInsets.only(right: TSizes.sm),
        backgroundColor: THelperFunctions.isDarkMode(context)
            ? TColors.darkerGrey
            : TColors.light,
        child: Image(
          image: AssetImage(image),
          fit: BoxFit.contain,
        )),
  );
}
