import 'package:flutter/material.dart';
import 'package:t_store/common/Widgets/cutomWidgets/customProductCountWithAddAndRemove.dart';
import 'package:t_store/features/shop/screens/cart/widget/customCartItem.dart';
import 'package:t_store/features/shop/screens/home/screen/widgets/customPriceWidget.dart';
import 'package:t_store/utils/constants/sizes.dart';

class customCartItems extends StatelessWidget {
  const customCartItems({
    super.key,
    this.showAddRemoveButton = true,
  });

  final bool showAddRemoveButton;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Column(
            children: [
              customCartItem(),
              if (showAddRemoveButton)
                SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
              if (showAddRemoveButton)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 70,
                        ),
                        customProductQuantityWithAddAndRemove(),
                      ],
                    ),
                    customPrice(price: 256)
                  ],
                )
            ],
          );
        },
        separatorBuilder: (_, __) {
          return SizedBox(
            height: TSizes.spaceBtwSections,
          );
        },
        itemCount: 4);
  }
}
