import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/controllers/homeCrousalController.dart';
import '../../../../../../common/Widgets/customShapes/containers/customCircularContainer.dart';
import '../../../../../../common/Widgets/cutomWidgets/customRoundedCrousal.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';

class homePromoSlider extends StatelessWidget {
  const homePromoSlider({
    super.key,
    required this.list,
  });
  final List<String> list;
  @override
  Widget build(BuildContext context) {
    final homeCrousalController controller = Get.put(homeCrousalController());

    return Column(
      children: [
        CarouselSlider(
            items: list
                .map((url) => customRoundedImageBanner(
                      imageUrl: url,
                    ))
                .toList(),
            options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                controller.updatePageIndicator(index);
              },
            )),
        const SizedBox(
          height: TSizes.sm,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  list.length,
                  (index) => customCircularContainer(
                        radius: 20,
                        width: 20,
                        height: 4,
                        margin: const EdgeInsets.only(left: 10),
                        padding: const EdgeInsets.all(TSizes.lg),
                        backgroundColor:
                            controller.current_crousal_index.value == index
                                ? TColors.primary
                                : TColors.grey,
                      )))),
        )
      ],
    );
  }
}
