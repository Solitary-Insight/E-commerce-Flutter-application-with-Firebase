import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/Widgets/appBar/customAppBar.dart';
import 'package:t_store/common/Widgets/cutomWidgets/customCartItems.dart';
import 'package:t_store/common/Widgets/cutomWidgets/customProductCountWithAddAndRemove.dart';

import 'package:t_store/features/shop/screens/cart/widget/customCartItem.dart';
import 'package:t_store/features/shop/screens/checkout/checkoutScreen.dart';
import 'package:t_store/features/shop/screens/home/screen/widgets/customPriceWidget.dart';

import 'package:t_store/utils/constants/sizes.dart';

class cartScreen extends StatelessWidget {
  const cartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: Text(
          "Cart",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () {
            Get.to(() => checkoutScreen());
          },
          child: Text("Checkout \$234"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: customCartItems(),
      ),
    );
  }
}
