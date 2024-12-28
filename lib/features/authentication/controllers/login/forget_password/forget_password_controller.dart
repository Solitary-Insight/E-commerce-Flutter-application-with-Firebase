import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:t_store/common/Widgets/cutomWidgets/loaders/loaders.dart';
import 'package:t_store/data/repos/authentication/autethentication_repository.dart';
import 'package:t_store/features/authentication/screens/login/resetPasswordScreen.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/helpers/popups/fullscreen_loader.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  ///Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  /// Sent Reset password email
  sendPasswordResetEmail() async {
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

      if (!forgetPasswordFormKey.currentState!.validate()) {
        customFullScreenLoader.stopLoading();

        return;
      }
      await AuthencationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      // Remove the loader
      customFullScreenLoader.stopLoading();

      loader.successSnackBar(
          title: "Email sent",
          message: 'Email link sent to Reset your password'.tr);

      //Redirect
      Get.to(() => resetPasswordScreen(
            email: email.text.trim(),
          ));
    } catch (e) {
      // Remove the loader
      customFullScreenLoader.stopLoading();

      //Show Error

      loader.errorSnackBar(
          title: "Email resend failed!", message: e.toString());
    }
  }

  /// ReSent Reset password email
  reSendPasswordResetEmail(String email) async {
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

      await AuthencationRepository.instance.sendPasswordResetEmail(email);

      // Remove the loader
      customFullScreenLoader.stopLoading();

      loader.successSnackBar(
          title: "Email sent",
          message: 'Email link sent to Reset your password'.tr);
    } catch (e) {
      // Remove the loader
      customFullScreenLoader.stopLoading();

      //Show Error

      loader.errorSnackBar(
          title: "Email resend failed!", message: e.toString());
    }
  }
}
