import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/Widgets/customShapes/containers/customCircularContainer.dart';
import 'package:t_store/common/Widgets/cutomWidgets/customRoundedCrousal.dart';
import 'package:t_store/features/shop/screens/home/screen/widgets/customPriceWidget.dart';
import 'package:t_store/features/shop/screens/product_details/productDetailScreen.dart';
import 'package:t_store/utils/constants/image_strings.dart';

import 'customBrandTitleWithVerification.dart';
import 'customCircularIcon.dart';
import 'customProductTextTitle.dart';
import '../../styles/TStyleShadow.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class customProductCardVertical extends StatelessWidget {
  const customProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    var darkMode = THelperFunctions.isDarkMode(context);
    return InkWell(
      onTap: () {
        Get.to(() => const productDetailScreen());
      },
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: darkMode ? TColors.darkerGrey : TColors.white,
        ),
        child: Column(
          children: [
            customCircularContainer(
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: darkMode ? TColors.dark : TColors.light,
              height: 180,
              child: Stack(
                children: [
                  const Center(
                    child: customRoundedImageBanner(
                      imageUrl: TImages.productImage1,
                      applyImageRadius: true,
                    ),
                  ),
                  Positioned(
                    top: 6,
                    child: customCircularContainer(
                      radius: TSizes.sm,
                      width: 50,
                      height: 30,
                      backgroundColor: TColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: TSizes.sm, vertical: TSizes.xs),
                      child: Center(
                        child: Text(
                          '25%',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .apply(color: TColors.black),
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    right: 0,
                    top: 0,
                    child: customCircularIcon(
                      icon: Iconsax.heart5,
                    ),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  productTextTileWidget(
                    title: "Geen Nike Air Shoes",
                    smallSize: true,
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),
                  customBrandTitleWithVerification(
                    title: "Nike",
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const Padding(
                padding: EdgeInsets.only(left: TSizes.sm),
                child: customPrice(
                  price: 33,
                  isLarge: true,
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    color: TColors.dark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(TSizes.cardRadiusLg),
                      bottomRight: Radius.circular(TSizes.productImageRadius),
                    )),
                child: const SizedBox(
                  width: TSizes.iconLg * 1.2,
                  height: TSizes.iconLg * 1.2,
                  child: Icon(
                    Iconsax.add,
                    color: TColors.white,
                  ),
                ),
              )
            ])
          ],
        ),
      ),
    );
  }
}
