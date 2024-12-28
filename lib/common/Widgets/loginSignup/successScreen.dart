import 'package:flutter/material.dart';
import 'package:t_store/common/styles/spacing_style.dart';

import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class successScreen extends StatelessWidget {
  const successScreen({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.onPressed,
    this.email,
  });

  final String image, title, subTitle;
  final String? email;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppbarHeight * 2,
          child: Column(
            children: [
              Center(
                child: Image(
                  image: AssetImage(image),
                  width: THelperFunctions.screenWidth() * 0.6,
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              // TODO: Title and subtitle
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(
                email ?? '',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(
                subTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    child: const Text(TTexts.tContinue), onPressed: onPressed),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
