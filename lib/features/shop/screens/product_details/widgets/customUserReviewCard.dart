import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:t_store/common/Widgets/customShapes/containers/customCircularContainer.dart';
import 'package:t_store/common/Widgets/cutomWidgets/customRating/customRatingsWidget.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../../common/Widgets/cutomWidgets/customRating/customRatingStarWidget.dart';
import '../../../../../utils/constants/sizes.dart';

class customUserReviewCard extends StatelessWidget {
  const customUserReviewCard({super.key});
  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                    backgroundImage: AssetImage(TImages.userProfileImage1)),
                SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
                Text(
                  'Rehana Khan',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
          ],
        ),
        SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            customRatingStarWidget(
              rating: 3.5,
            ),
            SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text(
              '01 Nov, 2021',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        ReadMoreText(
          "The usr interface of the app is qit intutive. was able to navigate and make purchase seamlessly. Greate job!",
          trimLines: 1,
          trimMode: TrimMode.Line,
          trimCollapsedText: 'Show More',
          trimExpandedText: "   Less",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
          moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              color: TColors.primary),
          lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              color: TColors.primary),
        ),
        SizedBox(
          height: TSizes.spaceBtwItems,
        ),

// Company Reply

        SizedBox(
          width: double.infinity,
          child: customCircularContainer(
            backgroundColor: dark ? TColors.darkGrey : TColors.grey,
            child: Padding(
              padding: EdgeInsets.all(TSizes.md),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Royalion Store",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        " 01 Nov, 2021",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  ReadMoreText(
                    "The usr interface of the app is qit intutive. was able to navigate and make purchase seamlessly. Greate job!",
                    trimLines: 1,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show More',
                    trimExpandedText: "   Less",
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                    moreStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: TColors.primary),
                    lessStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: TColors.primary),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: TSizes.spaceBtwSections,
        ),
      ],
    );
  }
}
