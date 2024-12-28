import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/Widgets/appBar/customAppBar.dart';
import 'package:t_store/common/Widgets/cutomWidgets/customCircularIcon.dart';
import 'package:t_store/common/Widgets/cutomWidgets/custom_product_card_vertical.dart';
import 'package:t_store/common/Widgets/cutomWidgets/layout/customGrid.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../home/screen/homeScreen.dart';

class wishListScreen extends StatelessWidget {
  const wishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: Text(
          "Wishlist",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          customCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(() => const homeScreen()),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              customGrid(
                  mainAxisExtent: 288,
                  itemCount: 3,
                  itemBuilder: (_, index) => const customProductCardVertical())
            ],
          ),
        ),
      ),
    );
  }
}
