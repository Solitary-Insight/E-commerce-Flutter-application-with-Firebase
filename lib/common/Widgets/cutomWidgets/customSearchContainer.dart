import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/utils/device/device_utility.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class customSearchContainer extends StatelessWidget {
  const customSearchContainer({
    super.key,
    this.showBackground = true,
    this.showBorder = true,
    this.icon = Iconsax.search_normal,
    required this.text,
    required this.onPressed,
    this.padding =
        const EdgeInsets.symmetric(horizontal: TSizes.spaceBtwSections),
  });
  final bool showBackground, showBorder;
  final IconData? icon;
  final String text;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: padding,
        child: Container(
          width: TDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(TSizes.sm),
          decoration: BoxDecoration(
              color: showBackground
                  ? dark
                      ? TColors.white
                      : TColors.dark
                  : TColors.transparent,
              borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
              border: showBorder
                  ? Border.all(color: TColors.grey)
                  : Border.all(color: TColors.transparent)),
          child: Row(
            children: [
              Icon(
                icon,
                color: TColors.darkGrey,
              ),
              const SizedBox(width: TSizes.spaceBtwItems),
              Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .apply(color: TColors.darkGrey),
                overflow: TextOverflow.clip,
              )
            ],
          ),
        ),
      ),
    );
  }
}
