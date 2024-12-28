import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/authentication/controllers/signup/signup_controller.dart';
import 'package:t_store/features/authentication/screens/signup/widgets/termsAndConditions.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/validators/validation.dart';

class signUpForm extends StatelessWidget {
  const signUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final SignupController controller = Get.put(SignupController());
    return Form(
        key: controller.signupFormKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    validator: (value) =>
                        TValidator.validateEmptyText("First Name", value),
                    controller: controller.firstName,
                    expands: false,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.user),
                        labelText: TTexts.firstName),
                  ),
                ),
                const SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
                Flexible(
                  child: TextFormField(
                    validator: (value) =>
                        TValidator.validateEmptyText("Last Name", value),
                    controller: controller.lastName,
                    expands: false,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.user),
                      labelText: TTexts.lastName,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            TextFormField(
              expands: false,
              validator: (value) =>
                  TValidator.validateEmptyText("Username", value),
              controller: controller.userName,
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.user_edit),
                labelText: TTexts.username,
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            TextFormField(
              expands: false,
              validator: (value) => TValidator.validateEmail(value),
              controller: controller.email,
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct),
                labelText: TTexts.email,
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            TextFormField(
              expands: false,
              validator: (value) => TValidator.validatePhoneNumber(value),
              controller: controller.phoneNumber,
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.call),
                labelText: TTexts.phoneNo,
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            Obx(
              () => TextFormField(
                expands: false,
                validator: (value) => TValidator.validatePassword(value),
                controller: controller.password,
                obscureText: controller.hide_password.value,
                decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.password_check),
                    labelText: TTexts.password,
                    suffixIcon: IconButton(
                      onPressed: () => controller.hide_password.value =
                          !controller.hide_password.value,
                      icon: Icon(
                        controller.hide_password.value
                            ? Iconsax.eye
                            : Iconsax.eye_slash,
                      ),
                    )),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            termsAndConditions(),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  controller.signup();
                },
                child: const Text(TTexts.createAccount),
              ),
            ),
          ],
        ));
  }
}
