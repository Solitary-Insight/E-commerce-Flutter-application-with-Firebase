import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:t_store/common/Widgets/appBar/customAppBar.dart';
import 'package:t_store/common/Widgets/cutomWidgets/customBrandCard.dart';
import 'package:t_store/common/Widgets/cutomWidgets/layout/customGrid.dart';
import 'package:t_store/features/shop/screens/all_brands/brandProducts.dart';
import 'package:t_store/features/shop/screens/all_products/sortableProducts.dart';
import 'package:t_store/utils/constants/sizes.dart';

class allBrandsScreen extends StatelessWidget {
  const allBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: Text("All Brands"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              customGrid(
                  mainAxisExtent: 80,
                  itemCount: 8,
                  itemBuilder: (_, index) => customBrandCard(
                        showBorder: true,
                        onTap: () {
                          // Get.to(() => sortableProducts());
                          Get.to(() => brandProducts());
                        },
                      )),
            ],
          ),
        ),
      ),
    );
  }
}
