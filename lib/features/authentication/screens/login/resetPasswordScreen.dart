import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/styles/spacing_style.dart';
import 'package:t_store/features/authentication/screens/login/loginScreen.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class resetPasswordScreen extends StatelessWidget {
  const resetPasswordScreen({super.key, this.email});
  final String? email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(CupertinoIcons.clear))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: TSpacingStyle.paddingWithAppbarHeight,
            child: Column(
              children: [
                Center(
                  child: Image(
                    image: const AssetImage(TImages.deliveredEmailIllustration),
                    width: THelperFunctions.screenWidth() * 0.6,
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwSections),

                // TODO: Title and subtitle
                Text(
                  TTexts.changeYourPasswordTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                Text(
                  email ?? '',
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                Text(
                  TTexts.changeYourPasswordSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: const Text(TTexts.done),
                    onPressed: () {
                      Get.offAll(() => loginScreen());
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
