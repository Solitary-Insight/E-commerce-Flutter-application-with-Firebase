import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:t_store/features/authentication/controllers/signup/signup_controller.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class termsAndConditions extends StatelessWidget {
  const termsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);
    final SignupController controller = SignupController.instance;

    return Row(
      children: [
        Obx(
          () => SizedBox(
            width: 24,
            height: 24,
            child: Checkbox(
                value: controller.privacyPolicy.value,
                onChanged: (value) {
                  controller.privacyPolicy.value = value!;
                }),
          ),
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        Flexible(
            child: Text.rich(TextSpan(children: [
          TextSpan(
              text: '${TTexts.iAgreeTo} ',
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
            text: '${TTexts.privacyPolicy} ',
            style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? TColors.light : TColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? TColors.light : TColors.primary,
                ),
          ),
          TextSpan(
              text: '${TTexts.and} ',
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
            text: '${TTexts.termsOfUse} ',
            style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? TColors.light : TColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? TColors.light : TColors.primary,
                ),
          ),
        ]))),
      ],
    );
  }
}
