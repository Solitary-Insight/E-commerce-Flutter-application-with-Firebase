import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/personlization/controllers/user_controller.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/validators/validation.dart';

class reAuthenticateScreen extends StatelessWidget {
  const reAuthenticateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(
        title: Text("Re-Authenticate user"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.verifyEmail,
                  validator: (value) => TValidator.validateEmail(value),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: TTexts.confirmEmail,
                  ),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwInputFields,
                ),
                Obx(
                  () => TextFormField(
                    controller: controller.verifyPassword,
                    obscureText: controller.showPassword.value,
                    validator: (value) => TValidator.validateEmail(value),
                    decoration: InputDecoration(
                      prefixIcon: IconButton(
                        icon: Icon(controller.showPassword.value
                            ? Iconsax.eye_slash
                            : Iconsax.eye),
                        onPressed: () {
                          controller.showPassword.value =
                              !controller.showPassword.value;
                        },
                      ),
                      labelText: TTexts.password,
                    ),
                  ),
                ),
                SizedBox(
                  height: TSizes.spaceBtwInputFields,
                  child: ElevatedButton(
                      onPressed: () => controller.deleteAccountWarningPopup(),
                      child: const Text("Verify")),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
