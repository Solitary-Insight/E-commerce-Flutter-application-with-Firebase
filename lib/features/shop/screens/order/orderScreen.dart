import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/Widgets/appBar/customAppBar.dart';
import 'package:t_store/common/Widgets/customShapes/containers/customCircularContainer.dart';
import 'package:t_store/features/shop/screens/order/widgets/customOrderListItem.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class orderScreen extends StatelessWidget {
  const orderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          showBackArrow: true,
          title: Text("My Orders",
              style: Theme.of(context).textTheme.headlineSmall)),
      body: ListView.builder(
          itemBuilder: (_, __) {
            return customOrderListItem();
          },
          itemCount: 4),
    );
  }
}
