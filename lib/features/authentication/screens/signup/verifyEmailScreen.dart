import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repos/authentication/autethentication_repository.dart';
import 'package:t_store/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class verifyEmail extends StatelessWidget {
  const verifyEmail({super.key, required this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    /// Controller to handle Email Verification
    final controller = Get.put(VerifyEmailController());

    return Scaffold(
      appBar: AppBar(
        // TODO: REMOVE BACK ARROW IN IOS
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Get.offAll(() {
                AuthencationRepository.instance.logout();
              });
            },
            icon: const Icon(CupertinoIcons.clear),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // TODO: Image
              Image(
                image: const AssetImage(TImages.deliveredEmailIllustration),
                width: THelperFunctions.screenWidth() * 0.6,
              ),

              const SizedBox(height: TSizes.spaceBtwSections),

              // TODO: Title and subtitle
              Text(
                TTexts.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(
                email ?? "",
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(
                TTexts.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text(TTexts.tContinue),
                  onPressed: () {
                    controller.checkEmailVerificationStatus();
                  },
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  child: const Text(TTexts.resendEmail),
                  onPressed: () {
                    controller.sendEmailVerification();
                  },
                ),
              ),

              // TODO: Buttons
            ],
          ),
        ),
      ),
    );
  }
}
