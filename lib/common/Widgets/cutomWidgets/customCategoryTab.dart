import 'package:flutter/cupertino.dart';
import 'package:t_store/common/Widgets/cutomWidgets/customBrandShowCase.dart';
import 'package:t_store/common/Widgets/cutomWidgets/customSectionHeadingWidget.dart';
import 'package:t_store/common/Widgets/cutomWidgets/custom_product_card_vertical.dart';
import 'package:t_store/common/Widgets/cutomWidgets/layout/customGrid.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class customCategoryTab extends StatelessWidget {
  const customCategoryTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // TODo: Brand
              const customBrandShowCase(
                images: [
                  TImages.productImage1,
                  TImages.productImage3,
                  TImages.productImage3,
                  TImages.productImage2,
                ],
              ),
              customSectionHeading(
                heading: "You might like",
                onPressed: () {},
                ShowButton: true,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              customGrid(
                  itemCount: 4,
                  mainAxisExtent: 288,
                  itemBuilder: (_, index) => const customProductCardVertical()),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              // TODo: Product You May Like
            ],
          ),
        )
      ],
    );
  }
}
