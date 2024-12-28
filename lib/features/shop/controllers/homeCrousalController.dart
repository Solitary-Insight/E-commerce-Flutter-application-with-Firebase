import 'package:get/get.dart';

class homeCrousalController extends GetxController {
  static homeCrousalController get instance => Get.find();

  Rx<int> current_crousal_index = 0.obs;

  void updatePageIndicator(index) {
    current_crousal_index.value = index;
  }
}
