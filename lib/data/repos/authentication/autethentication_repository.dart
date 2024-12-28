import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:t_store/data/repos/user/userRepository.dart';
import 'package:t_store/features/authentication/screens/login/loginScreen.dart';
import 'package:t_store/features/authentication/screens/onboarding/onboardingScreen.dart';
import 'package:t_store/features/authentication/screens/signup/verifyEmailScreen.dart';
import 'package:t_store/navigationMenu.dart';
import 'package:t_store/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:t_store/utils/exceptions/firebase_exceptions.dart';
import 'package:t_store/utils/exceptions/format_exceptions.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';

class AuthencationRepository extends GetxController {
  static AuthencationRepository get instance => Get.find();
  // Variables
  final device_storage = GetStorage();
  final _auth = FirebaseAuth.instance;
  User? get authUser => _auth.currentUser;
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  void screenRedirect() async {
    final user = _auth.currentUser;
    //check firebase login
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const naviagtionMenu());
      } else {
        Get.offAll(() => verifyEmail(
              email: _auth.currentUser?.email,
            ));
      }
    } else {
      // check Value
      device_storage.writeIfNull("IsFirstTime", true);
      device_storage.read("IsFirstTime") != true
          ? Get.offAll(() => const loginScreen())
          : Get.offAll(() => const OnboardingScreen());
    }
  }

//
// Email and password reAuthentication

  Future<UserCredential> reAuthenticateWithEmailAndPassword(
      String email, String password) async {
    try {
      AuthCredential credentials =
          EmailAuthProvider.credential(email: email, password: password);
      return await _auth.currentUser!.reauthenticateWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Somethig went wrong. Please try again';
    }
  }

// Email and password Sigin

  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.removeUserRecord(authUser!.uid);
      await _auth.currentUser?.delete();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Somethig went wrong. Please try again';
    }
  }

// Email and password Sigin

  Future<UserCredential> sigInWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Somethig went wrong. Please try again';
    }
  }

// Google Sign in

  Future<UserCredential?> sigInViaGoogle() async {
    try {
      // todo show google signin pop up '
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;
      // todo create new credentials '
      final OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      //* once Signin return the credentials
      return await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Somethig went wrong. Please try again';
    }
  }

// firbase Authentication Create account

  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Somethig went wrong. Please try again';
    }
  }

  ///[EmailVerification] -Mail Verification

  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) print("Something went wrong : $e");
      // throw 'Somethig went wrong. Please try again';
      return null;
    }
  }

  ///[ Reset password using email ]  Reset password using email

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) print("Something went wrong : $e");
      // throw 'Somethig went wrong. Please try again';
      return null;
    }
  }

  ///[Logout Functionality] -Mail Logout Functionality

  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();
      Get.offAll(() => const loginScreen());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Somethig went wrong. Please try again';
    }
  }
}
