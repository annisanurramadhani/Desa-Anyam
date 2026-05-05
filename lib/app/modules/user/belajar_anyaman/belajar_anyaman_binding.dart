// belajar_anyaman_binding.dart

import 'package:get/get.dart';
import 'belajar_anyaman_controller.dart';

class BelajarAnyamanBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<BelajarAnyamanController>(
      () => BelajarAnyamanController(),
    );
  }

}