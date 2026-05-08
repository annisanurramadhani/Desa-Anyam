// home_pengrajin_binding.dart

import 'package:get/get.dart';

import 'home_pengrajin_controller.dart';

class HomePengrajinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomePengrajinController>(() => HomePengrajinController());
  }
}
