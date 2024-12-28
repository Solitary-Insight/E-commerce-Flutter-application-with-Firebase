import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/sizes.dart';

class customGrid extends StatelessWidget {
  const customGrid({
    super.key,
    required this.itemCount,
    this.mainAxisExtent = 280,
    required this.itemBuilder,
  });

  final int itemCount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: TSizes.gridViewSpacing,
          mainAxisExtent: mainAxisExtent,
          crossAxisSpacing: TSizes.gridViewSpacing),
      itemBuilder: itemBuilder,
      padding: EdgeInsets.zero,
      itemCount: itemCount,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}
