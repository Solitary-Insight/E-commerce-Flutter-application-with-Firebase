import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:t_store/common/Widgets/cutomWidgets/loaders/loaders.dart';
import 'package:t_store/common/Widgets/loginSignup/successScreen.dart';
import 'package:t_store/data/repos/authentication/autethentication_repository.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  /// Send the email and set the timer for auto redirect
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoReirect();
    super.onInit();
  }

  /// Send Email Link
  ///
  ///
  void sendEmailVerification() async {
    try {
      await AuthencationRepository.instance.sendEmailVerification();
      loader.successSnackBar(
          title: "Email Sent",
          message: "Please Check your inbox and verify your email.");
    } catch (e) {
      loader.errorSnackBar(title: "Oh Snap", message: e.toString());
    }
  }

  /// Timer to automatically redirect on email varification
  setTimerForAutoReirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = await FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => successScreen(
            image: TImages.staticSuccessIllustration,
            title: TTexts.yourAccountCreatedTitle,
            subTitle: TTexts.yourAccountCreatedSubTitle,
            onPressed: () {
              AuthencationRepository.instance.screenRedirect();
            }));
      }
    });
  }

  ///Manualy check if Email is verified

  checkEmailVerificationStatus() async {
    final currentUser = await FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => successScreen(
          image: TImages.staticSuccessIllustration,
          title: TTexts.yourAccountCreatedTitle,
          subTitle: TTexts.yourAccountCreatedSubTitle,
          onPressed: () {
            AuthencationRepository.instance.screenRedirect();
          }));
    }
  }

  ///
}
