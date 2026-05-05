import 'package:get/get.dart';
import 'detail_pengrajin_controller.dart';

class DetailPengrajinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailPengrajinController>(
      () => DetailPengrajinController(),
    );
  }
}