import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/Widgets/appBar/customAppBar.dart';
import 'package:t_store/common/Widgets/cutomWidgets/custom_product_card_vertical.dart';
import 'package:t_store/common/Widgets/cutomWidgets/layout/customGrid.dart';
import 'package:t_store/features/shop/screens/all_products/sortableProducts.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class allProductScreen extends StatelessWidget {
  const allProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var darkMode = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: customAppBar(
        title: Text("Popular Products"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: sortableProducts(),
        ),
      ),
    );
  }
}
