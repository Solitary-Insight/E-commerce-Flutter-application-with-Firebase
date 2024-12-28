import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:t_store/bindings/generalBindings.dart';
import 'package:t_store/features/authentication/screens/onboarding/onboardingScreen.dart';
import 'package:t_store/navigationMenu.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: TTexts.appName,
        themeMode: ThemeMode.system,
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        initialBinding: GeneralBindings(),
        home: Scaffold(
            backgroundColor: TColors.primary,
            body: Center(
                child: CircularProgressIndicator(
              color: TColors.white,
            ))));
  }
}

// TODO : get sha-1 and sha-2 Fingerprints in linux
//* keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android
