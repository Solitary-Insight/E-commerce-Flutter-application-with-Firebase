import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/Widgets/appBar/customAppBar.dart';
import 'package:t_store/common/Widgets/appBar/customTabBar.dart';
import 'package:t_store/common/Widgets/cutomWidgets/customBrandCard.dart';
import 'package:t_store/common/Widgets/cutomWidgets/customCountedIcon.dart';
import 'package:t_store/common/Widgets/cutomWidgets/customSearchContainer.dart';
import 'package:t_store/common/Widgets/cutomWidgets/customSectionHeadingWidget.dart';
import 'package:t_store/common/Widgets/cutomWidgets/layout/customGrid.dart';
import 'package:t_store/features/shop/screens/all_brands/allBrandsScreen.dart';
import 'package:t_store/features/shop/screens/cart/cartScreen.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../common/Widgets/cutomWidgets/customCategoryTab.dart';

class storeScreen extends StatelessWidget {
  const storeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: customAppBar(
          title: Text(
            "Store",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            customCountedIcon(
              onPressed: () {
                Get.to(() => const cartScreen());
              },
              count: 6,
              icon: Iconsax.shopping_bag4,
            )
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              pinned: true,
              floating: true,
              automaticallyImplyLeading: false,
              backgroundColor: THelperFunctions.isDarkMode(context)
                  ? TColors.black
                  : TColors.white,
              expandedHeight: 440,
              flexibleSpace: Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                    customSearchContainer(
                      text: "Search in store",
                      onPressed: () {},
                      showBackground: false,
                      padding: EdgeInsets.zero,
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                    customSectionHeading(
                      heading: "Featured Brands",
                      ShowButton: true,
                      onPressed: () => Get.to(() => const allBrandsScreen()),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwInputFields / 1.5,
                    ),
                    customGrid(
                        itemCount: 4,
                        mainAxisExtent: 80,
                        itemBuilder: (_, index) => const customBrandCard(
                              showBorder: true,
                            )),
                  ],
                ),
              ),
              bottom: const customTabBar(
                tabs: [
                  Text("Animals"),
                  Text("Sports"),
                  Text("Furniture"),
                  Text("Fun"),
                  Text("Entertainment"),
                  Text("Electronics"),
                ],
              ),
            )
          ],
          body: const TabBarView(
            children: [
              customCategoryTab(),
              customCategoryTab(),
              customCategoryTab(),
              customCategoryTab(),
              customCategoryTab(),
              customCategoryTab(),
            ],
          ),
        ),
      ),
    );
  }
}
