import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/Widgets/appBar/customAppBar.dart';
import 'package:t_store/common/Widgets/cutomWidgets/customSectionHeadingWidget.dart';
import 'package:t_store/common/Widgets/cutomWidgets/customSettingMenuTile.dart';
import 'package:t_store/common/Widgets/main/widgets/TPrimaryHeaderContainer.dart';
import 'package:t_store/data/repos/authentication/autethentication_repository.dart';
import 'package:t_store/features/personlization/screen/address/widgets/addressScreem.dart';
import 'package:t_store/features/shop/screens/order/orderScreen.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../../common/Widgets/cutomWidgets/customUserProfileTile.dart';

class settingScreen extends StatelessWidget {
  const settingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // todo: Headers
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  customAppBar(
                      title: Text(
                    "Account",
                    style: Theme.of(context).textTheme.headlineMedium,
                  )),
                  const SizedBox(height: TSizes.defaultSpace),
                  const customProfileTile(),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),

            // todo: body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  // todo: Section Heading
                  const customSectionHeading(heading: "Account Settings"),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  customSettingMenuTile(
                      onTap: () {
                        Get.to(() => const addressScreen());
                      },
                      icon: Iconsax.safe_home,
                      title: "My Address",
                      subTitle: 'Manage your home address'),

                  const customSettingMenuTile(
                      icon: Iconsax.shopping_cart,
                      title: "My Cart",
                      subTitle: 'View and manage your shopping cart'),

                  customSettingMenuTile(
                    icon: Iconsax.bag_tick,
                    title: "My Orders",
                    subTitle: 'Track and manage your orders',
                    onTap: () => Get.to(() => orderScreen()),
                  ),

                  const customSettingMenuTile(
                      icon: Iconsax.bank,
                      title: "Bank Account",
                      subTitle: 'Manage your linked bank account'),

                  const customSettingMenuTile(
                      icon: Iconsax.discount_shape,
                      title: "My Coupons",
                      subTitle: 'View and manage your available coupons'),

                  const customSettingMenuTile(
                      icon: Iconsax.notification,
                      title: "Notifications",
                      subTitle: 'Manage your notification preferences'),

                  const customSettingMenuTile(
                      icon: Iconsax.security_card,
                      title: "Account Privacy",
                      subTitle: 'Control your account privacy settings'),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  const customSectionHeading(heading: "App Settings"),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const customSettingMenuTile(
                      icon: Iconsax.document_upload,
                      title: "Load Data",
                      subTitle: 'Upload Data to your Cloud Storage'),

                  customSettingMenuTile(
                    icon: Iconsax.location,
                    title: "Location Services",
                    subTitle: 'Control your location privacy settings',
                    trailing: Switch(
                      value: false,
                      onChanged: (val) {},
                    ),
                  ),

                  customSettingMenuTile(
                    icon: Iconsax.security_user,
                    title: "User Security",
                    subTitle: 'Manage your account security settings',
                    trailing: Switch(
                      value: true,
                      onChanged: (val) {},
                    ),
                  ),

                  customSettingMenuTile(
                    icon: Iconsax.image,
                    title: "Image Quality",
                    subTitle: 'Adjust your image display settings',
                    trailing: Switch(
                      value: false,
                      onChanged: (val) {},
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      child: const Text("Logout"),
                      onPressed: () {
                        AuthencationRepository.instance.logout();
                      },
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
