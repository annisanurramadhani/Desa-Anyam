// belajar_anyaman_controller.dart

import 'package:get/get.dart';

class BelajarAnyamanController extends GetxController {

  void changeMenu(int index) {

    if (index == 1) {
      Get.offAllNamed('/home');
    }

    if (index == 2) {
      Get.toNamed('/profile');
    }
  }
}