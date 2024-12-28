import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/Widgets/customShapes/containers/customCircularContainer.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class customOrderListItem extends StatelessWidget {
  const customOrderListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);

    return Padding(
        padding: EdgeInsets.all(TSizes.sm),
        child: customCircularContainer(
          showBorder: true,
          backgroundColor: dark ? TColors.dark : TColors.light,
          padding: EdgeInsets.all(TSizes.md),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Iconsax.ship),
                      SizedBox(
                        width: TSizes.spaceBtwSections / 2,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Processing",
                            style: Theme.of(context).textTheme.bodyLarge!.apply(
                                color: TColors.primary, fontWeightDelta: 1),
                          ),
                          Text("02 jan,2021",
                              style:
                                  Theme.of(context).textTheme.headlineSmall!),
                        ],
                      )
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Iconsax.arrow_right_3),
                  )
                ],
              ),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Row(
                children: [
                  Flexible(
                    child: Row(
                      children: [
                        Icon(Iconsax.tag),
                        SizedBox(
                          width: TSizes.spaceBtwSections / 2,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Order",
                                style:
                                    Theme.of(context).textTheme.labelMedium!),
                            Text("CWTOO12",
                                style:
                                    Theme.of(context).textTheme.titleMedium!),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: TSizes.spaceBtwSections / 2,
                  ),
                  Flexible(
                    child: Row(
                      children: [
                        Icon(Iconsax.calendar),
                        SizedBox(
                          width: TSizes.spaceBtwSections / 2,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Shipping Date",
                                style:
                                    Theme.of(context).textTheme.labelMedium!),
                            Text("05 jan,2021",
                                style:
                                    Theme.of(context).textTheme.titleMedium!),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
