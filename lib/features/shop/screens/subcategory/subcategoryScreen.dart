import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:t_store/common/Widgets/appBar/customAppBar.dart';
import 'package:t_store/common/Widgets/cutomWidgets/customRoundedCrousal.dart';
import 'package:t_store/common/Widgets/cutomWidgets/customSectionHeadingWidget.dart';
import 'package:t_store/common/Widgets/cutomWidgets/custom_product_card_horizontal.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class subCategoryScreen extends StatelessWidget {
  const subCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: Text("Sports shirts"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //  todo: banner
              customRoundedImageBanner(
                imageUrl: TImages.banner1,
                applyImageRadius: true,
                width: double.infinity,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              //  todo: Subctegory

              Column(
                children: [
                  // todo: Heading
                  customSectionHeading(
                    heading: "Sport Shoes",
                    ShowButton: true,
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return customProductCardHorizontal();
                      },
                      separatorBuilder: (_, __) => const SizedBox(
                        width: TSizes.spaceBtwItems,
                      ),
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),

                  customSectionHeading(
                    heading: "Sport Shoes",
                    ShowButton: true,
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return customProductCardHorizontal();
                      },
                      separatorBuilder: (_, __) => const SizedBox(
                        width: TSizes.spaceBtwItems,
                      ),
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),

                  customSectionHeading(
                    heading: "Sport Shoes",
                    ShowButton: true,
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return customProductCardHorizontal();
                      },
                      separatorBuilder: (_, __) => const SizedBox(
                        width: TSizes.spaceBtwItems,
                      ),
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
