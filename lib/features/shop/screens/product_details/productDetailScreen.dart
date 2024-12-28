import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/Widgets/cutomWidgets/customSectionHeadingWidget.dart';
import 'package:t_store/features/shop/screens/product_details/productReviewScreen.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/customBottomAddToCart.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/customProductMetaData.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/product_attribute.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:readmore/readmore.dart';
import '../../../../common/Widgets/cutomWidgets/customImageSlider.dart';
import 'widgets/customRatingAndShare.dart';

class productDetailScreen extends StatelessWidget {
  const productDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: customBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // todo : Image Slider
            customImageSlider(),

            // todo: Product details

            Padding(
              padding: EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  // todo : rating and Share Button
                  customRatingAndShare(
                    rating: 3,
                    count: 78,
                  ),
                  customProductMetaData(),

                  // todo: Attribute
                  customProductAttributes(),

                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  // todo: Checkout Button

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {}, child: Text("Checkout")),
                  ),

                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  // todo: Discription

                  customSectionHeading(heading: "Description"),
                  ReadMoreText(
                    "This is product description and is been writer here for eleboarative user satifaction with features and qaulaty before buying product",
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show More',
                    trimExpandedText: "   Less",
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                  Divider(),

                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child:
                              customSectionHeading(heading: "Reviews (621)")),
                      IconButton(
                          onPressed: () {
                            Get.to(() => const productReviewScreen());
                          },
                          icon: Icon(Iconsax.arrow_right))
                    ],
                  )

                  // todo: Reviews
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
