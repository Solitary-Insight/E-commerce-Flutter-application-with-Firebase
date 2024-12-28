import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/Widgets/appBar/customAppBar.dart';
import 'package:t_store/common/Widgets/cutomWidgets/customCircularImage.dart';
import 'package:t_store/common/Widgets/cutomWidgets/customSectionHeadingWidget.dart';
import 'package:t_store/common/Widgets/cutomWidgets/loaders/customShimmerLoader.dart';
import 'package:t_store/features/personlization/controllers/user_controller.dart';
import 'package:t_store/features/personlization/screen/profile/changeNameScreen.dart';
import 'package:t_store/features/personlization/screen/profile/customProfileMenu.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class profileScreen extends StatelessWidget {
  const profileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Scaffold(
      appBar: customAppBar(
        title: Text("Profile"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // todo: Profile Image
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networKImage = controller.user.value.profilePicture;
                      final image =
                          networKImage.isNotEmpty ? networKImage : TImages.user;

                      return controller.isImageUploading.value
                          ? const customShimmerLoader(
                              width: 80, height: 80, radius: 80)
                          : customCircularImage(
                              imageUrl: image,
                              height: 80,
                              width: 80,
                              isNetworkImage: networKImage.isNotEmpty,
                            );
                    }),
                    TextButton(
                        onPressed: () {
                          controller.uploadUserProfile();
                        },
                        child: Text("Change Profile Image"))
                  ],
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              customSectionHeading(heading: "Profile Information"),
              const SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),

              Obx(
                () => customProfileMenu(
                  title: "Name",
                  value: controller.user.value.fullName,
                  onPressed: () {
                    Get.to(() => changeNameScreen());
                  },
                ),
              ),
              customProfileMenu(
                title: "Username",
                value: controller.user.value.username,
                onPressed: () {},
              ),
              Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              customSectionHeading(heading: "Personal Information"),
              const SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              customProfileMenu(
                title: "E-mail",
                value: controller.user.value.email,
                onPressed: () {},
              ),
              customProfileMenu(
                title: "User-ID",
                value: controller.user.value.id,
                onPressed: () {},
                icon: Iconsax.copy,
              ),
              customProfileMenu(
                title: "Phone Number",
                value: controller.user.value.phoneNumber,
                onPressed: () {},
              ),
              customProfileMenu(
                title: "Gender",
                value: "Male",
                onPressed: () {},
              ),
              customProfileMenu(
                title: "Date of  birth",
                value: "02 june, 2003",
                onPressed: () {},
              ),
              Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Close Account",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
