import 'package:flutter/material.dart';
import 'package:t_store/common/Widgets/appBar/customAppBar.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/customUserReviewCard.dart';
import 'package:t_store/utils/constants/sizes.dart';
import '../../../../common/Widgets/cutomWidgets/customRating/customRatingStarWidget.dart';
import '../../../../common/Widgets/cutomWidgets/customRating/customRatingsWidget.dart';

class productReviewScreen extends StatelessWidget {
  const productReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: Text("Reviews & Ratings"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "Rating and reviews are verified and are from peaople wh0 use the same type of device that you use."),
              SizedBox(
                height: TSizes.defaultSpace,
              ),
              customRatingsWidget(
                rating: 3.5,
              ),
              customRatingStarWidget(
                rating: 3.5,
              ),
              Text(
                '12,611',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              customUserReviewCard(),
              customUserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
