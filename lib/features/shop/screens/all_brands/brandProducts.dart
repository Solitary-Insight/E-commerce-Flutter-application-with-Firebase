import 'package:flutter/material.dart';
import 'package:t_store/common/Widgets/appBar/customAppBar.dart';
import 'package:t_store/common/Widgets/cutomWidgets/customBrandCard.dart';
import 'package:t_store/features/shop/screens/all_products/sortableProducts.dart';
import 'package:t_store/utils/constants/sizes.dart';

class brandProducts extends StatelessWidget {
  const brandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: Text("Brand Products"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              customBrandCard(
                showBorder: true,
              ),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              sortableProducts()
            ],
          ),
        ),
      ),
    );
  }
}
