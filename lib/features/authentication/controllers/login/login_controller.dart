import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/common/Widgets/cutomWidgets/loaders/loaders.dart';
import 'package:t_store/data/repos/authentication/autethentication_repository.dart';
import 'package:t_store/features/personlization/controllers/user_controller.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/helpers/popups/fullscreen_loader.dart';

class LoginController extends GetxController {
  // static LoginController instance=>Get.find();

  //variables
  Rx<bool> rememberMe = false.obs;
  Rx<bool> hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  // todo: check if user saved email and password
  @override
  void onInit() {
    email.text = localStorage.read("REMEMBER_ME_EMAIL");
    password.text = localStorage.read("REMEMBER_ME_PASSWORD");
    super.onInit();
  }

  // *Signin using google provided authentication via firebase

  Future<void> loginUsingEmailAndPassword() async {
    try {
      // todo: Start Loading
      customFullScreenLoader.openLoadingDialog(
          'We are processing your information ...', TImages.loading_animation);
      // todo: Check internet connectivity

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // remove the loader
        customFullScreenLoader.stopLoading();

        return;
      }
      // todo: Form Validation

      if (!loginFormKey.currentState!.validate()) {
        // remove the loader
        customFullScreenLoader.stopLoading();

        return;
      }
      // todo  Check if user has checked remember me  checkbox
      if (rememberMe.value) {
        localStorage.write("REMEMBER_ME_EMAIL", email.text.trim());
        localStorage.write("REMEMBER_ME_PASSWORD", password.text.trim());
      }

      // * login user using email and password
      final userCredentials = await AuthencationRepository.instance
          .sigInWithEmailAndPassword(email.text.trim(), password.text.trim());

      // remove the loader
      customFullScreenLoader.stopLoading();

      // todo Redirect
      AuthencationRepository.instance.screenRedirect();
    } catch (e) {
      // remove the loader

      customFullScreenLoader.stopLoading();

      loader.errorSnackBar(title: "Oh Snap!", message: e.toString());
    } finally {}
  }

  Future<void> googleSignIn() async {
    try {
      // todo: Start Loading
      customFullScreenLoader.openLoadingDialog(
          'Logging you in...', TImages.loading_animation);
      // todo: Check internet connectivity

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // remove the loader
        customFullScreenLoader.stopLoading();

        return;
      }
      //todo -----------------------------
      // GOOGLE AUTHENTICATION
      //todo -----------------------------
      final userCredentials =
          await AuthencationRepository.instance.sigInViaGoogle();

      // Save user record
      await userController.saveUserRecord(userCredentials);
      // remove the loader
      customFullScreenLoader.stopLoading();
      // screen redirect
      AuthencationRepository.instance.screenRedirect();
    } catch (e) {
      // remove the loader
      customFullScreenLoader.stopLoading();
      loader.errorSnackBar(title: "Sigin failed!", message: e.toString());
    }
  }
}
