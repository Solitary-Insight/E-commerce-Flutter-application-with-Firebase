import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/Widgets/loginSignup/loginPageDivider.dart';
import 'package:t_store/common/Widgets/loginSignup/socialButtons.dart';
import 'package:t_store/common/styles/spacing_style.dart';
import 'package:t_store/features/authentication/screens/signup/verifyEmailScreen.dart';
import 'package:t_store/features/authentication/screens/signup/widgets/signUpForm.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class signUpScreen extends StatelessWidget {
  const signUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: Padding(
        padding: TSpacingStyle.paddingWithAppbarHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TODO: Title

            Text(
              TTexts.signupTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            const SizedBox(
              height: TSizes.defaultSpace,
            ),

            // TODO: Form
            const signUpForm(),
            const SizedBox(height: TSizes.defaultSpace),
            // termsAndConditions(),

            const SizedBox(height: TSizes.defaultSpace),
            const authPageDivider(),
            const SizedBox(height: TSizes.defaultSpace),
            const socialButtons()
          ],
        ),
      )),
    );
  }
}
