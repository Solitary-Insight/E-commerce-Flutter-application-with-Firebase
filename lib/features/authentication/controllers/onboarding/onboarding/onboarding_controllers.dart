import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/features/authentication/screens/login/loginScreen.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  final pageController = PageController();

  Rx<int> currrentPageIndex = 0.obs;

  void updatePageIndicator(index) {
    currrentPageIndex.value = index;
  }

  void dotNavigationClick(index) {
    currrentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  void nextPage() {
    if (currrentPageIndex.value == 2) {
      final device_storage = GetStorage();
      device_storage.write("IsFirstTime", false);

      Get.offAll(() => const loginScreen());
    } else {
      currrentPageIndex.value += 1;
      pageController.jumpToPage(currrentPageIndex.value);
    }
  }

  void skipPage() {
    currrentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
