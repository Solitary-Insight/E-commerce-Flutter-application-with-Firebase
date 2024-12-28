import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/Widgets/cutomWidgets/custom_product_card_vertical.dart';
import 'package:t_store/common/Widgets/cutomWidgets/layout/customGrid.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class sortableProducts extends StatelessWidget {
  const sortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var darkMode = THelperFunctions.isDarkMode(context);

    return Column(
      children: [
        // todo : Dropdown
        DropdownButtonFormField(
          decoration: InputDecoration(
              prefix: Icon(
            Iconsax.sort,
            color: darkMode ? TColors.light : TColors.dark,
          )),
          items: [
            "Name",
            "Higher Price",
            "Lower Price",
            "Sale",
            'Newest',
            'Popularity'
          ]
              .map((e) => DropdownMenuItem(
                    child: Text(e),
                    value: e,
                  ))
              .toList(),
          onChanged: (value) {},
        ),
        SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        customGrid(
          mainAxisExtent: 288,
          itemCount: 38,
          itemBuilder: (_, index) => const customProductCardVertical(),
        )
      ],
    );
  }
}
