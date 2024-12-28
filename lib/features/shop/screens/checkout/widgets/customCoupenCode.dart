import 'package:flutter/material.dart';
import 'package:t_store/common/Widgets/customShapes/containers/customCircularContainer.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class customCouponCode extends StatelessWidget {
  const customCouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);

    return customCircularContainer(
      backgroundColor: dark ? TColors.dark : TColors.white,
      showBorder: true,
      padding: EdgeInsets.only(
          top: TSizes.sm, bottom: TSizes.sm, right: TSizes.sm, left: TSizes.md),
      child: Row(
        children: [
          Expanded(
              child: TextFormField(
            decoration: const InputDecoration(
              hintText: "Have a promo code? Enter here",
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
          )),
          ElevatedButton(
            onPressed: () {},
            child: Text("Apply"),
            style: ElevatedButton.styleFrom(
                foregroundColor: dark
                    ? TColors.white.withOpacity(0.5)
                    : TColors.dark.withOpacity(0.5),
                backgroundColor: TColors.grey.withOpacity(0.2),
                side: BorderSide(color: Colors.grey.withOpacity(0.1))),
          )
        ],
      ),
    );
  }
}
