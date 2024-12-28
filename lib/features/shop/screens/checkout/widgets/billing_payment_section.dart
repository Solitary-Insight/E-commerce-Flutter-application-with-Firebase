import 'package:flutter/material.dart';
import 'package:t_store/common/Widgets/customShapes/containers/customCircularContainer.dart';
import 'package:t_store/common/Widgets/cutomWidgets/customSectionHeadingWidget.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class billing_payement_section extends StatelessWidget {
  const billing_payement_section({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);

    return Column(
      children: [
        customSectionHeading(
          heading: "Payement Method",
          buttonText: "Change",
          ShowButton: true,
          onPressed: () {},
        ),
        SizedBox(
          height: TSizes.spaceBtwItems / 2,
        ),
        Row(
          children: [
            customCircularContainer(
              backgroundColor: dark ? TColors.light : TColors.white,
              width: 60,
              height: 60,
              child: Image(
                image: AssetImage(TImages.paypal),
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              width: TSizes.spaceBtwItems / 2,
            ),
            Text(
              'Paypal',
              style: Theme.of(context).textTheme.bodyLarge,
            )
          ],
        ),
      ],
    );
  }
}
