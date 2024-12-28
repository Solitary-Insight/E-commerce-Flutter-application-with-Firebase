import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/utils/constants/sizes.dart';

class customRatingAndShare extends StatelessWidget {
  const customRatingAndShare({
    super.key,
    required this.count,
    required this.rating,
  });
  final int count, rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // todo: Rating
        Row(
          children: [
            Icon(
              Iconsax.star5,
              color: Colors.amber,
              size: 24,
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems / 2,
            ),
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: '$rating',
                  style: Theme.of(context).textTheme.bodyLarge),
              TextSpan(
                text: ' ($count)',
              ),
            ]))
          ],
        ),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Iconsax.share,
              size: TSizes.iconMd,
            ))
      ],
    );
  }
}
