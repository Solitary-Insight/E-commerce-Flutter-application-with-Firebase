import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:t_store/common/Widgets/cutomWidgets/custom_product_card_vertical.dart';
import 'package:t_store/features/shop/screens/all_products/allProductScreen.dart';
import 'package:t_store/features/shop/screens/home/screen/widgets/homePromoSlider.dart';
import 'package:t_store/features/shop/screens/home/screen/widgets/homeScreenCategoryList.dart';
import 'package:t_store/features/shop/screens/home/screen/widgets/homepageAppBar.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import '../../../../../common/Widgets/cutomWidgets/customSearchContainer.dart';
import '../../../../../common/Widgets/cutomWidgets/customSectionHeadingWidget.dart';
import '../../../../../common/Widgets/cutomWidgets/layout/customGrid.dart';
import '../../../../../common/Widgets/main/widgets/TPrimaryHeaderContainer.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              // height: 320,
              child: Column(
                children: [
                  const homePageAppBar(),
                  const SizedBox(height: TSizes.defaultSpace),
                  customSearchContainer(
                    onPressed: () {
                      print("Ready to search");
                    },
                    text: "Search in container",
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                        left: TSizes.defaultSpace, top: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        customSectionHeading(
                          heading: "Top categories",
                          ShowButton: false,
                        ),
                        SizedBox(height: TSizes.defaultSpace),
                        homeCategoriesList(),
                        SizedBox(height: TSizes.defaultSpace),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(TSizes.sm),
                child: Column(
                  children: [
                    const homePromoSlider(
                      list: [
                        TImages.banner1,
                        TImages.banner2,
                        TImages.banner3,
                        TImages.banner4,
                        TImages.banner6,
                      ],
                    ),
                    const SizedBox(height: TSizes.sm),
                    customSectionHeading(
                      heading: "Popular products",
                      ShowButton: true,
                      onPressed: () {
                        Get.to(() => allProductScreen());
                      },
                      textColor: THelperFunctions.isDarkMode(context)
                          ? TColors.white
                          : TColors.dark,
                    ),
                    customGrid(
                      mainAxisExtent: 288,
                      itemCount: 8,
                      itemBuilder: (_, index) =>
                          const customProductCardVertical(),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
