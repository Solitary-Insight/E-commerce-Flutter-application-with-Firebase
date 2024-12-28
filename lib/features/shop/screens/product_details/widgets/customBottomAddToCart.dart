import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/Widgets/cutomWidgets/customCircularIcon.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class customBottomAddToCart extends StatelessWidget {
  const customBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: TSizes.defaultSpace, vertical: TSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: dark ? TColors.darkerGrey : TColors.light,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(TSizes.cardRadiusLg),
            topRight: Radius.circular(TSizes.cardRadiusLg)),
      ),
      // ignore: prefer_const_constructors
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              customCircularIcon(
                icon: Iconsax.minus,
                height: 40,
                width: 40,
                color: TColors.white,
                backgroundColor: TColors.darkGrey,
              ),
              SizedBox(
                width: TSizes.spaceBtwItems,
              ),
              Text(
                '2',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              SizedBox(
                width: TSizes.spaceBtwItems,
              ),
              const customCircularIcon(
                icon: Iconsax.add,
                height: 40,
                width: 40,
                color: TColors.white,
                backgroundColor: TColors.black,
              ),
            ],
          ),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(TSizes.md),
                  backgroundColor: TColors.black,
                  side: BorderSide(color: TColors.black)),
              child: const Text("Add to cart"))
        ],
      ),
    );
  }
}
