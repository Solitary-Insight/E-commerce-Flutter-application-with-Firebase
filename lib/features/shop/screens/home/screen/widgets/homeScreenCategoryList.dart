import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:t_store/features/shop/screens/subcategory/subcategoryScreen.dart';
import 'package:t_store/utils/constants/image_strings.dart';

import '../../../../../../common/Widgets/cutomWidgets/customVerticalImageTextWidget.dart';

class homeCategoriesList extends StatelessWidget {
  const homeCategoriesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<category> list = [];
    list.add(category(cat_name: "Animals", cat_image: TImages.animalIcon));
    list.add(category(cat_name: "Shoes", cat_image: TImages.shoeIcon));
    list.add(
        category(cat_name: "Furnitures", cat_image: TImages.furnitureIcon));
    list.add(category(cat_name: "Sports", cat_image: TImages.sportIcon));
    list.add(
        category(cat_name: "Electronics", cat_image: TImages.electronicsIcon));
    list.add(category(cat_name: "Jewellry", cat_image: TImages.jeweleryIcon));
    list.add(category(cat_name: "Cloths", cat_image: TImages.clothIcon));

    return SizedBox(
      height: 80,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: list.length,
          shrinkWrap: true,
          itemBuilder: (_, index) {
            return customVerticalImageTextWidget(
              text: list[index].cat_name,
              image: AssetImage(list[index].cat_image),
              onPressed: () {
                Get.to(subCategoryScreen());
              },
            );
          }),
    );
  }
}

class category {
  final String cat_name;
  final String cat_image;

  category({required this.cat_name, required this.cat_image});
}
