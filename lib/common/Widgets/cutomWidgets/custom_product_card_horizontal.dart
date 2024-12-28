import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/Widgets/cutomWidgets/customBrandTitleWithVerification.dart';
import 'package:t_store/common/Widgets/cutomWidgets/customCircularIcon.dart';
import 'package:t_store/common/Widgets/cutomWidgets/customProductTextTitle.dart';
import 'package:t_store/common/Widgets/cutomWidgets/customRoundedCrousal.dart';
import 'package:t_store/common/styles/TStyleShadow.dart';
import 'package:t_store/features/shop/screens/home/screen/widgets/customPriceWidget.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../features/shop/screens/product_details/productDetailScreen.dart';
import '../customShapes/containers/customCircularContainer.dart';

class customProductCardHorizontal extends StatelessWidget {
  const customProductCardHorizontal({super.key});

  Widget build(BuildContext context) {
    var darkMode = THelperFunctions.isDarkMode(context);
    return InkWell(
      onTap: () {
        Get.to(() => const productDetailScreen());
      },
      child: Container(
        width: 310,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: darkMode ? TColors.darkerGrey : TColors.lightContainer,
        ),
        child: Row(
          children: [
            customCircularContainer(
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: darkMode ? TColors.dark : TColors.light,
              height: 120,
              child: Stack(
                children: [
                  SizedBox(
                    height: 120,
                    width: 120,
                    child: customRoundedImageBanner(
                      imageUrl: TImages.productImage1,
                      applyImageRadius: true,
                    ),
                  ),
                  Positioned(
                    top: 8,
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
            SizedBox(
              width: 172,
              child: Padding(
                padding: EdgeInsets.only(top: TSizes.sm, left: TSizes.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
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
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
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
                                bottomRight:
                                    Radius.circular(TSizes.productImageRadius),
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
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
