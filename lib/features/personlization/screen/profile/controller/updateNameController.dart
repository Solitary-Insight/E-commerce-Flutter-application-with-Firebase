import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/Widgets/cutomWidgets/loaders/loaders.dart';
import 'package:t_store/data/repos/user/userRepository.dart';
import 'package:t_store/features/personlization/controllers/user_controller.dart';
import 'package:t_store/features/personlization/screen/profile/profileScreen.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/helpers/popups/fullscreen_loader.dart';

class updateNameController extends GetxController {
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());

  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  void initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      // todo: Start Loading
      customFullScreenLoader.openLoadingDialog(
          'Changing name...', TImages.loading_animation);
      // todo: Check internet connectivity

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // remove the loader
        customFullScreenLoader.stopLoading();

        return;
      }
      if (!updateUserNameFormKey.currentState!.validate()) {
        // remove the loader
        customFullScreenLoader.stopLoading();

        return;
      }

      // todo UPDATE DATA

      Map<String, dynamic> name = {
        "firstName": firstName.text.trim(),
        "lastName": lastName.text.trim()
      };

      await userRepository.updateSingleField(name);

      // update username locally
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      // remove the loader
      customFullScreenLoader.stopLoading();

      loader.successSnackBar(
          title: "Congratulations", message: "Your Name has been updated");

      // Move to previus screen
      Get.back();
    } catch (e) {
      // remove the loader
      customFullScreenLoader.stopLoading();
      loader.errorSnackBar(title: "Sigin failed!", message: e.toString());
    }
  }
}
