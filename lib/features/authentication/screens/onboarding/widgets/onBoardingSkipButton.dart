import 'package:flutter/material.dart';
import 'package:t_store/features/authentication/controllers/onboarding/onboarding/onboarding_controllers.dart';
import 'package:t_store/utils/constants/sizes.dart';

class onBoardingSkipButton extends StatelessWidget {
  const onBoardingSkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnboardingController.instance;

    return Positioned(
        top: TSizes.appBarHeight,
        right: TSizes.defaultSpace,
        child: TextButton(
          child: const Text("Skip"),
          onPressed: () {
            controller.skipPage();
          },
        ));
  }
}
