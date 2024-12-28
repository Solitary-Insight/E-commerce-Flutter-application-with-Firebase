import 'package:flutter/material.dart';
import 'package:t_store/common/Widgets/customShapes/containers/customCircularContainer.dart';
import 'package:t_store/common/Widgets/cutomWidgets/customSectionHeadingWidget.dart';
import 'package:t_store/features/shop/screens/home/screen/widgets/customPriceWidget.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import '../../../../../common/Widgets/cutomWidgets/customProductTextTitle.dart';

// ignore: camel_case_types
class customProductAttributes extends StatelessWidget {
  const customProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        customCircularContainer(
          backgroundColor: dark ? TColors.darkerGrey : TColors.light,
          padding: EdgeInsets.all(TSizes.md),
          child: Column(
            // Todo: Title Price and Stock Status
            children: [
              Row(
                children: [
                  Expanded(child: customSectionHeading(heading: "Variation")),
                  SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const productTextTileWidget(
                            title: "Price: ",
                            smallSize: true,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // todo: Actual Price

                              Text(
                                '\$25',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .apply(
                                        decoration: TextDecoration.lineThrough),
                              ),

                              // todo: Sale Price
                              SizedBox(
                                width: TSizes.spaceBtwItems,
                                height: TSizes.sm,
                              ),
                              customPrice(price: 20)
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          productTextTileWidget(
                            title: "Stock : ",
                            smallSize: true,
                          ),
                          SizedBox(
                            width: TSizes.spaceBtwItems,
                            height: TSizes.sm,
                          ),
                          Text('In stock',
                              style: Theme.of(context).textTheme.titleMedium!),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              // Todo: variation Description
              productTextTileWidget(
                  smallSize: true,
                  maxLines: 4,
                  title:
                      "This is the description of the productand it can go upto max 4 lines ")
            ],
          ),
        ),

        // todo : ATTRIBUTES
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customSectionHeading(heading: "Colors"),
            SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            Wrap(
              children: [
                customChoiceChip(
                    text: "Green", selected: false, onSelected: (value) {}),
                customChoiceChip(
                    text: "Blue", selected: false, onSelected: (value) {}),
                customChoiceChip(
                    text: "Red", selected: true, onSelected: (value) {}),
              ],
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customSectionHeading(heading: "Sizes"),
            SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: TSizes.sm,
              children: [
                customChoiceChip(
                    text: "EU 34", selected: false, onSelected: (value) {}),
                customChoiceChip(
                    text: "EU 36", selected: true, onSelected: (value) {}),
                customChoiceChip(
                    text: "Eu 38", selected: false, onSelected: (value) {}),
              ],
            )
          ],
        )
      ],
    );
  }
}

class customChoiceChip extends StatelessWidget {
  const customChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });
  final String text;
  final bool selected;
  final void Function(bool)? onSelected;
  @override
  Widget build(BuildContext context) {
    final Color? color = THelperFunctions.getColor(text);
    bool isColor = color != null;
    return ChoiceChip(
      label: isColor ? const SizedBox() : Text(text),
      selected: selected,
      onSelected: onSelected,
      labelStyle: TextStyle(color: selected ? TColors.white : null),
      avatar: isColor
          ? customCircularContainer(
              backgroundColor: color,
              height: 50,
              width: 50,
            )
          : null,
      labelPadding: isColor ? EdgeInsets.all(0) : null,
      padding: isColor ? EdgeInsets.all(0) : null,
      shape: isColor ? const CircleBorder() : null,
      backgroundColor: isColor ? color : null,
    );
  }
}
