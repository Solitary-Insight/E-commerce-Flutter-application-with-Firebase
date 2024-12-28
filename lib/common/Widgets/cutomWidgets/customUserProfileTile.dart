import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/Widgets/cutomWidgets/customCircularImage.dart';
import 'package:t_store/features/personlization/controllers/user_controller.dart';
import 'package:t_store/features/personlization/screen/profile/profileScreen.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';

class customProfileTile extends StatelessWidget {
  const customProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: const customCircularImage(
        imageUrl: TImages.user,
        padding: 0,
        height: 56,
        width: 56,
      ),
      title: Text(
        controller.user.value.fullName,
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: TColors.white),
      ),
      subtitle: Text(
        controller.user.value.email,
        style:
            Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),
      ),
      trailing: IconButton(
        icon: const Icon(
          Iconsax.edit,
          color: TColors.white,
        ),
        onPressed: () {
          Get.to(() => const profileScreen());
        },
      ),
    );
  }
}
