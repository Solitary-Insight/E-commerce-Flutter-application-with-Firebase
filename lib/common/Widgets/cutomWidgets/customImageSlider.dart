import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/Widgets/cutomWidgets/curvedEdgesWidget.dart';
import 'package:t_store/common/Widgets/cutomWidgets/customRoundedCrousal.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../appBar/customAppBar.dart';
import 'customCircularIcon.dart';

class customImageSlider extends StatelessWidget {
  const customImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);
    return curvedEdgesWidget(
        child: Container(
      color: dark ? TColors.darkerGrey : TColors.light,
      child: Stack(
        children: [
          // todo :Image
          SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(TSizes.productImageRadius * 2),
                child: Center(
                    child: Image(image: AssetImage(TImages.productImage5))),
              )),

          // todo : image Slider

          Positioned(
            bottom: 30,
            right: 0,
            left: TSizes.defaultSpace,
            child: SizedBox(
              height: 80,
              child: ListView.separated(
                physics: const AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, context) => customRoundedImageBanner(
                  border: Border.all(color: TColors.primary),
                  backgroundColor: dark ? TColors.dark : TColors.light,
                  imageUrl: TImages.productImage5,
                  padding: EdgeInsets.all(TSizes.sm),
                  width: 80,
                ),
                separatorBuilder: (_, __) => SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
                itemCount: 6,
              ),
            ),
          ),

          // todo : APP bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: customAppBar(
              showBackArrow: true,
              actions: [
                customCircularIcon(
                  icon: Iconsax.heart,
                  color: Colors.red,
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
