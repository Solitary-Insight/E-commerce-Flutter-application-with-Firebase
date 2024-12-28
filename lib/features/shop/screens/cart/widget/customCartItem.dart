import 'package:flutter/material.dart';
import 'package:t_store/common/Widgets/cutomWidgets/customBrandTitleWithVerification.dart';
import 'package:t_store/common/Widgets/cutomWidgets/customCircularImage.dart';
import 'package:t_store/common/Widgets/cutomWidgets/customProductTextTitle.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class customCartItem extends StatelessWidget {
  const customCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);

    return Column(
      children: [
        //Rounded Image
        Row(
          children: [
            // todo Image
            customCircularImage(
              imageUrl: TImages.productImage1,
              width: 60,
              height: 60,
              padding: TSizes.sm,
              backgroundColor: dark ? TColors.dark : TColors.light,
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            )

            // todo Title price and Size
            ,
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customBrandTitleWithVerification(
                    title: "Nike",
                  ),
                  productTextTileWidget(
                    title: "Geen Nike Air Shoes",
                    smallSize: true,
                    maxLines: 1,
                  ),
                  Text.rich(TextSpan(children: [
                    TextSpan(
                        text: " Color ",
                        style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(
                        text: " Green ",
                        style: Theme.of(context).textTheme.bodyLarge),
                    TextSpan(
                        text: " Size ",
                        style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(
                        text: " EU-32 ",
                        style: Theme.of(context).textTheme.bodyLarge),
                  ]))
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
