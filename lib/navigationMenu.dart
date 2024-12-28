import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/shop/screens/home/screen/homeScreen.dart';
import 'package:t_store/features/personlization/screen/setting/settingScreen.dart';
import 'package:t_store/features/shop/screens/store/storeScreen.dart';
import 'package:t_store/features/shop/screens/wishlist/screens/wishlistScreen.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class naviagtionMenu extends StatelessWidget {
  const naviagtionMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(NaviagationController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selected_index.value,
          backgroundColor: dark ? TColors.black : TColors.white,
          indicatorColor: dark
              ? TColors.white.withOpacity(0.1)
              : TColors.black.withOpacity(0.1),
          onDestinationSelected: (index) =>
              controller.selected_index.value = index,
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: "Home"),
            NavigationDestination(icon: Icon(Iconsax.shop), label: "Shop"),
            NavigationDestination(icon: Icon(Iconsax.heart), label: "Wishlist"),
            NavigationDestination(icon: Icon(Iconsax.user), label: "Profile"),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selected_index.value]),
    );
  }
}

class NaviagationController extends GetxController {
  final Rx<int> selected_index = 0.obs;

  final screens = [
    const homeScreen(),
    const storeScreen(),
    const wishListScreen(),
    const settingScreen(),
  ];
}
