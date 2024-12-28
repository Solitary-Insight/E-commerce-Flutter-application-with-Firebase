import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:t_store/common/Widgets/cutomWidgets/customSectionHeadingWidget.dart';
import 'package:t_store/utils/constants/sizes.dart';

class billing_address_section extends StatelessWidget {
  const billing_address_section({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customSectionHeading(
          heading: "Shipping Address",
          buttonText: "Change",
          ShowButton: true,
          onPressed: () {},
        ),
        Text(
          "Solitary Insight",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Row(
          children: [
            const Icon(
              Icons.phone,
              color: Colors.grey,
              size: 16,
            ),
            SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text(
              '+92-324-505718',
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
        SizedBox(
          width: TSizes.spaceBtwItems / 2,
        ),
        Row(
          children: [
            const Icon(
              Icons.location_history,
              color: Colors.grey,
              size: 16,
            ),
            SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Expanded(
              child: Text(
                'Hostel city Chatha Bakhtawar, Islamabad Pakistan',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            )
          ],
        ),
      ],
    );
  }
}
