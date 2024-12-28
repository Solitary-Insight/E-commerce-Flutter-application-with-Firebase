import 'package:flutter/material.dart';
import 'package:t_store/common/Widgets/customShapes/containers/customCircularContainer.dart';
import 'package:t_store/common/Widgets/cutomWidgets/customBrandTitleWithVerification.dart';
import 'package:t_store/common/Widgets/cutomWidgets/customCircularImage.dart';
import 'package:t_store/common/Widgets/cutomWidgets/customProductTextTitle.dart';
import 'package:t_store/features/shop/screens/home/screen/widgets/customPriceWidget.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class customProductMetaData extends StatelessWidget {
  const customProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // todo : Price and Sale Tag

        Row(
          children: [
            // todo : Sale
            customCircularContainer(
              backgroundColor: TColors.secondary.withOpacity(0.8),
              radius: TSizes.sm,
              padding: EdgeInsets.symmetric(
                  horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text(
                '25%',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: TColors.black),
              ),
            ),
            SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text('\$250',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .apply(decoration: TextDecoration.lineThrough)),
            SizedBox(
              width: TSizes.spaceBtwItems,
              child: Container(
                height: 3,
                color: Colors.white,
              ),
            ),
            customPrice(
              price: 175,
              isLarge: true,
            )
          ],
        ),

        // todo : Title
        SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),
        productTextTileWidget(
          title: "Green Mike Sport Shirt",
        ),

        // todo : Stack Status
        SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),
        Row(
          children: [
            productTextTileWidget(
              title: "Status",
            ),
            SizedBox(
              width: TSizes.spaceBtwItems / 1.5,
            ),
            Text(
              "In Stock",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),

        SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),

        // todo : Brand
        Row(
          children: [
            customCircularImage(
              imageUrl: TImages.shoeIcon,
              height: 32,
              width: 32,
              color: THelperFunctions.isDarkMode(context)
                  ? TColors.light
                  : TColors.dark,
            ),
            SizedBox(
              width: TSizes.spaceBtwItems / 1.5,
            ),
            customBrandTitleWithVerification(
              title: "Nike",
              brandTextSize: TextSizes.medium,
            ),
          ],
        )
      ],
    );
  }
}
