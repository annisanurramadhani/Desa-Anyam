import 'package:get/get.dart';
import 'detail_paket_controller.dart';

class DetailPaketBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailPaketController>(() => DetailPaketController());
  }
}