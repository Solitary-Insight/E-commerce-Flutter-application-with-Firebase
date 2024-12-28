import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/Widgets/appBar/customAppBar.dart';
import 'package:t_store/features/personlization/screen/address/widgets/addNewAddressScreen.dart';
import 'package:t_store/features/personlization/screen/address/widgets/customSingleAddress.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

class addressScreen extends StatelessWidget {
  const addressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => const addNewAddressScreen());
          },
          backgroundColor: TColors.primary,
          child: const Icon(
            Iconsax.add,
            color: TColors.white,
          ),
        ),
        appBar: customAppBar(
          showBackArrow: true,
          title: Text(
            "Addresses",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                customSingleAddress(selectedAddress: false),
                customSingleAddress(selectedAddress: false),
                customSingleAddress(selectedAddress: true),
                customSingleAddress(selectedAddress: false),
                customSingleAddress(selectedAddress: true),
                customSingleAddress(selectedAddress: true),
              ],
            ),
          ),
        ));
  }
}
