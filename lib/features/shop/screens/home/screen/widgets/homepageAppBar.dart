import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/Widgets/appBar/customAppBar.dart';
import 'package:t_store/common/Widgets/cutomWidgets/customCountedIcon.dart';
import 'package:t_store/common/Widgets/cutomWidgets/loaders/customShimmerLoader.dart';
import 'package:t_store/features/personlization/controllers/user_controller.dart';
import 'package:t_store/features/shop/screens/cart/cartScreen.dart';
import 'package:t_store/utils/constants/text_strings.dart';

import '../../../../../../utils/constants/colors.dart';

class homePageAppBar extends StatelessWidget {
  const homePageAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return customAppBar(
      showBackArrow: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TTexts.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: TColors.grey),
          ),
          Obx(() {
            if (controller.isDetailLoading.value) {
              return customShimmerLoader(width: 80, height: 15);
            }
            return Text(
              controller.user.value.fullName,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: TColors.white),
            );
          }),
        ],
      ),
      actions: [
        customCountedIcon(
          onPressed: () {
            Get.to(() => const cartScreen());
          },
          icon: Iconsax.shopping_cart,
          count: 14,
          iconColor: TColors.light,
        )
      ],
    );
  }
}
