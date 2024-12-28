import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/Widgets/customShapes/containers/customCircularContainer.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class customSingleAddress extends StatelessWidget {
  const customSingleAddress({super.key, required this.selectedAddress});
  final bool selectedAddress;
  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);

    return customCircularContainer(
      backgroundColor: selectedAddress
          ? TColors.primary.withOpacity(0.5)
          : TColors.transparent,
      showBorder: true,
      borderColor: selectedAddress
          ? TColors.transparent
          : dark
              ? TColors.darkerGrey
              : TColors.grey,
      width: double.infinity,
      padding: EdgeInsets.all(TSizes.md),
      margin: EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
              top: 0,
              right: 5,
              child: Icon(selectedAddress ? Iconsax.tick_circle5 : null,
                  color: selectedAddress
                      ? dark
                          ? TColors.light
                          : TColors.dark
                      : null)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Abdul Haseeb",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(
                height: TSizes.sm / 2,
              ),
              Text(
                "+923245305718",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: TSizes.sm / 2,
              ),
              Text(
                "32423 Timmy Caves, South Liana, maine 87234837, USA",
                softWrap: true,
              )
            ],
          )
        ],
      ),
    );
  }
}
