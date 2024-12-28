import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/authentication/controllers/onboarding/onboarding/onboarding_controllers.dart';
import 'package:t_store/features/authentication/screens/onboarding/widgets/onBoardingCircularButton.dart';
import 'package:t_store/features/authentication/screens/onboarding/widgets/onBoardingPage.dart';
import 'package:t_store/features/authentication/screens/onboarding/widgets/onBoardingSkipButton.dart';
import 'package:t_store/features/authentication/screens/onboarding/widgets/onBoardingSmoothPageIndicator.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              onBoardingPage(
                  title: TTexts.onBoardingTitle1,
                  subTitle: TTexts.onBoardingSubTitle1,
                  image: TImages.onBoardingImage1),
              onBoardingPage(
                  title: TTexts.onBoardingTitle2,
                  subTitle: TTexts.onBoardingSubTitle2,
                  image: TImages.onBoardingImage2),
              onBoardingPage(
                  title: TTexts.onBoardingTitle3,
                  subTitle: TTexts.onBoardingSubTitle3,
                  image: TImages.onBoardingImage3),
            ],
          ),
          const onBoardingSkipButton(),
          const onBoardingSmoothPageIndicator(),
          const onBoardingCircularButton()
        ],
      ),
    );
  }
}
