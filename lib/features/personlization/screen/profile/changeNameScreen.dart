import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/Widgets/appBar/customAppBar.dart';
import 'package:t_store/features/personlization/screen/profile/controller/updateNameController.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/validators/validation.dart';

class changeNameScreen extends StatelessWidget {
  const changeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(updateNameController());

    return Scaffold(
        appBar: customAppBar(
          showBackArrow: true,
          title: Text(
            "Change Name",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        body: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
            child: Column(children: [
              // Headings
              Text(
                "Use real name for easy verification. This name will appear in several pages.",
                style: Theme.of(context).textTheme.labelMedium,
              ),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              Form(
                key: controller.updateUserNameFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.firstName,
                      validator: (value) =>
                          TValidator.validateEmptyText("First Name", value),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.user),
                      ),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwInputFields,
                    ),
                    TextFormField(
                      controller: controller.lastName,
                      validator: (value) =>
                          TValidator.validateEmptyText("Last Name", value),
                      expands: false,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.user),
                      ),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          controller.updateUserName();
                        },
                        child: const Text("Save"),
                      ),
                    )
                  ],
                ),
              ),
            ])));
  }
}
