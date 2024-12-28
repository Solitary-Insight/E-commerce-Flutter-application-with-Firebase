import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:t_store/common/Widgets/cutomWidgets/loaders/loaders.dart';
import 'package:t_store/data/models/user/UserModel.dart';
import 'package:t_store/data/repos/authentication/autethentication_repository.dart';
import 'package:t_store/data/repos/user/userRepository.dart';
import 'package:t_store/features/authentication/screens/login/loginScreen.dart';
import 'package:t_store/features/authentication/screens/reauthenticate/reAuthenticateScreen.dart';
import 'package:t_store/features/authentication/screens/signup/verifyEmailScreen.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/helpers/popups/fullscreen_loader.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  Rx<UserModel> user = UserModel.empty().obs;
  final UserRepository userRepository = Get.put(UserRepository());
  Rx<bool> isDetailLoading = false.obs;
  Rx<bool> isImageUploading = false.obs;

  Rx<bool> showPassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();

  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();

    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try {
      isDetailLoading.value = true;
      final user = await userRepository.fechUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      isDetailLoading.value = false;
    }
  }

  /// Save user data from any registration provider
  Future<void> saveUserRecord(UserCredential? credential) async {
    try {
      await fetchUserRecord();
      if (user.value.id.isEmpty) {
        if (credential != null) {
          // convert name into first and last name;

          final namesParts =
              UserModel.nameParts(credential.user!.displayName ?? "");

          final username =
              UserModel.generateUsername(credential.user!.displayName ?? "");

          // Map Data

          final user = UserModel(
              id: credential.user!.uid,
              firstName: namesParts[0],
              lastName:
                  namesParts.length > 1 ? namesParts.sublist(1).join(" ") : '',
              username: username,
              phoneNumber: credential.user!.phoneNumber ?? '',
              email: credential.user!.email ?? '',
              profilePicture: credential.user!.photoURL ?? '');
          // save user record
          userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      loader.warningSnackBar(
          title: "Data not saved",
          message:
              'Something went wrong while saving your information. You can re-save your data in your profile.');
    }
  }

  ///Delete account warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(TSizes.md),
        title: "Delete Account",
        middleText:
            "Are you sure to delete your account. This action is irreversible and all your data wil be removed.",
        confirm: ElevatedButton(
            onPressed: () async {
              deletUserAccount();
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                side: const BorderSide(color: Colors.red)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: TSizes.lg),
              child: Text("Delete"),
            )),
        cancel: OutlinedButton(
            onPressed: () {
              Navigator.of(Get.overlayContext!).pop();
            },
            child: Text("Cancel")));
  }

  void deletUserAccount() async {
    try {
      customFullScreenLoader.openLoadingDialog(
          "Processing...", TImages.loading_animation);
      final auth = AuthencationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;

      if (!provider.isEmpty) {
        if (provider == 'google.com') {
          await auth.sigInViaGoogle();
          await auth.deleteAccount();
          customFullScreenLoader.stopLoading();
          Get.offAll(() => const loginScreen());
        } else if (provider == 'password') {
          customFullScreenLoader.stopLoading();
          Get.to(() => const reAuthenticateScreen());
        }
      }
    } catch (e) {
      customFullScreenLoader.stopLoading();
      loader.warningSnackBar(title: "Deletion Failed !", message: e.toString());
    }
  }

  // REAUTHENTICATE BEFORE DELETING THE ACCOUNT

  Future<void> reAuhenticateUser() async {
    try {
      // todo: Start Loading
      customFullScreenLoader.openLoadingDialog(
          'Deleting account ...', TImages.loading_animation);
      // todo: Check internet connectivity

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        customFullScreenLoader.stopLoading();

        return;
      }

      // todo: Form Validation
      if (!reAuthFormKey.currentState!.validate()) {
        // Remove the loader
        customFullScreenLoader.stopLoading();
        return;
      }

      await AuthencationRepository.instance.reAuthenticateWithEmailAndPassword(
          verifyEmail.text.trim(), verifyPassword.text.trim());

      // Remove the loader
      customFullScreenLoader.stopLoading();

      loader.successSnackBar(
          title: "Account deleted Successfully",
          message: 'Your account data has been removed'.tr);
    } catch (e) {
      // Remove the loader
      customFullScreenLoader.stopLoading();

      //Show Error

      loader.errorSnackBar(
          title: "Email resend failed!", message: e.toString());
    }
  }

  Future<void> uploadUserProfile() async {
    final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxHeight: 512,
        maxWidth: 512,
        imageQuality: 70);
    if (image != null) {
      try {
        isImageUploading.value = true;

        final imageUrl =
            await userRepository.uploadImage("user/images/profile", image);

        Map<String, dynamic> json = {'profilePicture': imageUrl ?? ''};
        await userRepository.updateSingleField(json);
        user.value.profilePicture = imageUrl ?? "";
        user.refresh();

        loader.successSnackBar(
            title: "Profile image updated!",
            message: "your profile has been updated");
      } catch (e) {
        loader.errorSnackBar(
            title: "Upload failed", message: "Something went wrong: $e");
      } finally {
        isImageUploading.value = false;
      }
    }
  }
}
