import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/Widgets/cutomWidgets/loaders/loaders.dart';
import 'package:t_store/data/repos/authentication/autethentication_repository.dart';
import 'package:t_store/data/repos/user/userRepository.dart';
import 'package:t_store/features/authentication/screens/signup/verifyEmailScreen.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/helpers/popups/fullscreen_loader.dart';

import '../../../../data/models/user/UserModel.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final hide_password = true.obs; // * Controlles Hiding and Showing of passwprd
  final privacyPolicy =
      false.obs; // * Controlles Check and Uncheck of of privacy policy

  final email = TextEditingController(); //*Controller For Email
  final lastName = TextEditingController(); //*Controller For lastName
  final userName = TextEditingController(); //*Controller For User Name
  final password = TextEditingController(); //*Controller For Password
  final firstName = TextEditingController(); //*Controller For First Name
  final phoneNumber = TextEditingController(); //*Controller For Phone

  GlobalKey<FormState> signupFormKey =
      GlobalKey<FormState>(); //*Form key for form validation

  Future<void> signup() async {
    try {
      // todo: Start Loading
      customFullScreenLoader.openLoadingDialog(
          'We are processing your information ...', TImages.loading_animation);
      // todo: Check internet connectivity

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        customFullScreenLoader.stopLoading();

        return;
      }
      // todo: Form Validation

      if (!signupFormKey.currentState!.validate()) {
        customFullScreenLoader.stopLoading();

        return;
      }
      // todo: Privacy Plicy Check
      if (!privacyPolicy.value) {
        loader.warningSnackBar(
            title: "Accept Privacy Policy",
            message:
                "In order to create account, you must have to read and accept the Privacy Policy & Terms of Use.");
        customFullScreenLoader.stopLoading();

        return;
      }
      // todo: Register usr in firebase authentication & save user data in firebase

      final userCredentials = await AuthencationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      // todo:  Save autheticated user in the firebase

      final newUser = UserModel(
        id: userCredentials.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: userName.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        email: email.text.trim(),
        profilePicture: '',
      );
      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // todo: Show Success Message
      loader.successSnackBar(
          title: "CongratulationS",
          message: 'Your account has been created! Verify email to continue.');
      // todo: Move to verify email screen
      customFullScreenLoader.stopLoading();

      Get.to(() => verifyEmail(email: email.text.trim()));
    } catch (e) {
      customFullScreenLoader.stopLoading();

      loader.errorSnackBar(title: "Oh Snap!", message: e.toString());
    } finally {}
  }
}
