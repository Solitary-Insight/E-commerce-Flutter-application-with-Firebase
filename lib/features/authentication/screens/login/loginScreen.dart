import 'package:flutter/material.dart';
import 'package:t_store/common/styles/spacing_style.dart';
import 'package:t_store/common/Widgets/loginSignup/loginPageDivider.dart';
import 'package:t_store/common/Widgets/loginSignup/socialButtons.dart';
import 'package:t_store/features/authentication/screens/login/widgets/loginPageForm.dart';
import 'package:t_store/features/authentication/screens/login/widgets/loginPageHeader.dart';
import 'package:t_store/utils/constants/sizes.dart';

class loginScreen extends StatelessWidget {
  const loginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SingleChildScrollView(
            child: Padding(
      padding: TSpacingStyle.paddingWithAppbarHeight,
      child: Column(
        children: [
          loginPageHeader(),
          loginPageForm(),

          SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          authPageDivider(),
          // TODO:Footer
          SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          socialButtons()
        ],
      ),
    )));
  }
}
