import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/authentication/controllers/login/login_controller.dart';
import 'package:t_store/features/authentication/screens/signup/signUpScreen.dart';
import 'package:t_store/features/authentication/screens/login/forgotPasswordScreen.dart';
import 'package:t_store/navigationMenu.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/validators/validation.dart';

class loginPageForm extends StatelessWidget {
  const loginPageForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Form(
        key: controller.loginFormKey,
        child: Padding(
          padding:
              const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
          child: Column(
            children: [
              TextFormField(
                controller: controller.email,
                validator: (value) => TValidator.validateEmail(value),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: TTexts.email,
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwInputFields,
              ),
              Obx(() => TextFormField(
                    controller: controller.password,
                    obscureText: controller.hidePassword.value,
                    validator: (value) =>
                        TValidator.validateEmptyText("Password", value),
                    decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.password_check),
                        labelText: TTexts.password,
                        suffixIcon: IconButton(
                          icon: Icon(controller.hidePassword.value
                              ? Iconsax.eye
                              : Iconsax.eye_slash),
                          onPressed: () {
                            controller.hidePassword.value =
                                !controller.hidePassword.value;
                          },
                        )),
                  )),
              const SizedBox(
                height: TSizes.spaceBtwInputFields / 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //TODO: Remember me
                  Row(
                    children: [
                      Obx(
                        () => Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (value) {
                            controller.rememberMe.value =
                                !controller.rememberMe.value;
                          },
                        ),
                      ),
                      const Text(TTexts.rememberMe)
                    ],
                  )
                  //TODO: Forget Password
                  ,
                  TextButton(
                    onPressed: () {
                      Get.to(() => const forgotPasswordScreen());
                    },
                    child: const Text(TTexts.forgetPassword),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                ],
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              // TODO: SIGNIN

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    controller.loginUsingEmailAndPassword();
                  },
                  child: const Text(TTexts.signIn),
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              // TODO: CREATE ACCOUNT

              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    Get.to(() => const signUpScreen());
                  },
                  child: const Text(TTexts.createAccount),
                ),
              )
            ],
          ),
        ));
  }
}
