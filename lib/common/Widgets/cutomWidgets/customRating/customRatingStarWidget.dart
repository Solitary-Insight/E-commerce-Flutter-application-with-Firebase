import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/utils/constants/colors.dart';

class customRatingStarWidget extends StatelessWidget {
  const customRatingStarWidget({
    super.key,
    required this.rating,
  });
  final double rating;
  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      itemSize: 20,
      rating: rating,
      itemCount: 5,
      unratedColor: TColors.grey,
      itemBuilder: (_, __) => const Icon(
        Iconsax.star1,
        color: TColors.primary,
      ),
    );
  }
}
