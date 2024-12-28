import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/Widgets/appBar/customAppBar.dart';
import 'package:t_store/common/Widgets/customShapes/containers/customCircularContainer.dart';
import 'package:t_store/common/Widgets/cutomWidgets/customCartItems.dart';
import 'package:t_store/common/Widgets/loginSignup/successScreen.dart';
import 'package:t_store/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:t_store/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:t_store/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:t_store/features/shop/screens/checkout/widgets/customCoupenCode.dart';
import 'package:t_store/navigationMenu.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class checkoutScreen extends StatelessWidget {
  const checkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: customAppBar(
        title: Text(
          "Order review",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () {
            Get.to(() => successScreen(
                image: TImages.successfulPaymentIcon,
                title: "Payement Success!",
                subTitle: 'Your item will be shipped soon!',
                onPressed: () => Get.offAll(() => const naviagtionMenu())));
          },
          child: Text("Checkout \$234"),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              customCartItems(
                showAddRemoveButton: false,
              ),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              // todo Coupen Input

              customCouponCode(),

              SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              customCircularContainer(
                backgroundColor: dark ? TColors.black : TColors.white,
                showBorder: true,
                padding: EdgeInsets.all(TSizes.md),
                child: Column(
                  children: [
                    // todo: Pricing
                    billing_amount_section(),
                    // todo: Divder
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    Divider(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    // todo: payment Methods
                    billing_payement_section(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    // todo: payment Address
                    billing_address_section()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
