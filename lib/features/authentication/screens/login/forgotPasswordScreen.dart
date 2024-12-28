import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/styles/spacing_style.dart';
import 'package:t_store/features/authentication/controllers/login/forget_password/forget_password_controller.dart';
import 'package:t_store/features/authentication/screens/login/loginScreen.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/validators/validation.dart';

class forgotPasswordScreen extends StatelessWidget {
  const forgotPasswordScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: TSpacingStyle.paddingWithAppbarHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // todo: Headings
            Text(
              TTexts.forgetPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            const SizedBox(height: TSizes.spaceBtwItems),
            Text(
              TTexts.forgetPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            // todo: Text Field
            const SizedBox(height: TSizes.spaceBtwItems * 2),

            Flexible(
                child: Form(
              key: controller.forgetPasswordFormKey,
              child: TextFormField(
                validator: TValidator.validateEmail,
                controller: controller.email,
                decoration: const InputDecoration(
                    labelText: TTexts.email,
                    prefixIcon: Icon(Iconsax.arrow_right_3)),
              ),
            )),

            const SizedBox(height: TSizes.spaceBtwItems * 2),

            // todo: Button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      controller.sendPasswordResetEmail();
                    },
                    child: const Text(TTexts.tContinue))),
            const SizedBox(height: TSizes.spaceBtwItems * 2),
            // todo: Button
            SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: () {
                      controller.reSendPasswordResetEmail(
                          controller.email.text.trim());
                    },
                    child: const Text(TTexts.resendEmail))),
          ],
        ),
      ),
    );
  }
}
