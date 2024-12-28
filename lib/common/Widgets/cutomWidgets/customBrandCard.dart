import 'package:flutter/material.dart';
import 'package:t_store/common/Widgets/customShapes/containers/customCircularContainer.dart';
import 'package:t_store/common/Widgets/cutomWidgets/customBrandTitleWithVerification.dart';
import 'package:t_store/common/Widgets/cutomWidgets/customCircularImage.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/image_strings.dart';

class customBrandCard extends StatelessWidget {
  const customBrandCard({
    super.key,
    this.showBorder = false,
    this.onTap,
  });
  final bool showBorder;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: customCircularContainer(
        padding: const EdgeInsets.all(TSizes.sm),
        showBorder: showBorder,
        backgroundColor: TColors.transparent,
        child: Row(
          children: [
            // TODO: ICon
            const Flexible(
              child: customCircularImage(
                imageUrl: TImages.animalIcon,
                padding: TSizes.md,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const customBrandTitleWithVerification(
                    title: 'Nike',
                    brandTextSize: TextSizes.large,
                  ),
                  Text(
                    '21 Products dsdfsdfgds',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
